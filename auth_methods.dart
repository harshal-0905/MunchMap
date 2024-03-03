class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async{
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //sign user up
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
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty)
      {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await storageMethods().uploadImageToStorage('profilePics', file, false);

        model.User user= model.User( 
          username:username,
          uid:cred.user!.uid,
          email:email,
          bio:bio,
          followers:[],
          followings:[],
          photoUrl: photoUrl,
        );
        //add user to our database
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res; 
  }
}
