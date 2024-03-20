import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:amazon_clone/features/auth/widgets/auth_input.dart';
import 'package:amazon_clone/features/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
  }

  void signUp() {
    authService.signUp(
        name: _nameController.text,
        context: context,
        email: _emailController.text,
        password: _passController.text);
  }

  void signIn() {
    authService.singIn(
        context: context,
        email: _emailController.text,
        password: _passController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.signUp
                    ? Colors.white
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        AuthInput(
                          hintText: "Name",
                          controller: _nameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthInput(
                          hintText: "Email",
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthInput(
                          hintText: "Password",
                          controller: _passController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signUp();
                            }
                          },
                          text: "Sign Up",
                          color: GlobalVariables.secondaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signIn
                    ? Colors.white
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: const Color.fromRGBO(255, 153, 0, 1),
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        AuthInput(
                          hintText: "Email",
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthInput(
                          hintText: "Password",
                          controller: _passController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onTap: () {
                            {
                              if (_signInFormKey.currentState!.validate()) {
                                signIn();
                              }
                            }
                          },
                          text: _auth == Auth.signIn ? "Sign-In" : "Sign Up",
                          color: GlobalVariables.secondaryColor,
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
