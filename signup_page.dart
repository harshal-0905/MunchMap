// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // text editing controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bioController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    bioController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // lets create an account for you
                Text(
                  'Let\'s create an account for you',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://tse2.mm.bing.net/th?id=OIP.vvmpWt0qBu3LeBgZuUfmGAHaFt&pid=Api&P=0&h=180'),
                          ),
                    Positioned(
                      bottom: -3,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                MyTextField(
                  controller: userNameController,
                  hintText: 'Username',
                  obscureText: false,
                  textInputType: TextInputType.text,
                ),

                const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  textInputType: TextInputType.text,
                ),
                /*
              const SizedBox(height: 10),
              // confirm password
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
                textInputType: TextInputType.text,
              ),
              */
                const SizedBox(
                  height: 10,
                ),

                MyTextField(
                  controller: bioController,
                  hintText: 'Bio',
                  obscureText: false,
                  textInputType: TextInputType.text,
                ),

                const SizedBox(height: 25),

                // sign in button
                InkWell(
                  child: MyButton(
                    text: "Sign Up",
                    onTap: () async {
                      String res = await AuthMethods().signUserUp(
                        email: emailController.text,
                        password: passwordController.text,
                        username: userNameController.text,
                        bio: bioController.text,
                        file: _image!,
                      );
                      print(res);
                    },
                  ),
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
