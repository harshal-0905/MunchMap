class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUserUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required file,
    // required Uint8List file,
  }) async {
    String res = "some error occured";

    try {
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file != null)
      {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await storageMethods().uploadImageToStorage('profilePics', file, false);

        //add user to our database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username':username,
          'uid':cred.user!.uid,
          'email':email,
          'bio':bio,
          'followers':[],
          'followings':[],
          'photoUrl': photoUrl,
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res; 
  }
}
