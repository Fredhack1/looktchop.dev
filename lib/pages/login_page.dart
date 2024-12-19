import 'package:flutter/material.dart';
import 'package:looktchop/components/button_component.dart';
import 'package:looktchop/components/passwd_textfield_component.dart';
import 'package:looktchop/components/textfield_component.dart';
import 'package:looktchop/pages/register_page.dart';
import 'package:looktchop/pages/reset_password_pages_viewer.dart';
import 'package:looktchop/utils/extensions.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 0, 51),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 237, 0, 51),
      //   title: const Text('Login'),
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back_ios),
      //   onPressed: () {},
      // ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 237, 0, 51),
            child: Column(
              children: [
                Container(
                  height: 150,
                  padding: const EdgeInsets.only(left: 30, bottom: 30),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 30)),

                        // Phone field label
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Phone',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Phone input field
                        TextFieldComponent(
                          hintText: '(+237) 698-526-974',
                          inputType: TextInputType.phone,
                          validator: (val) {
                            if (val!.isValidPhone == false) {
                              return "Enter a valid phone number";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Password field label
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Password input field
                        PasswordTextFieldComponent(
                          hintText: 'Password',
                          validator: (val) {
                            if (val!.isValidPassword == false) {
                              return "Enter a strong password";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),

                        // forgot password ?
                        Container(
                          padding: const EdgeInsets.only(right: 25),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordPagesViewer()));
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // login button
                        ButtonComponent(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            text: 'Login'),
                        const SizedBox(height: 15),

                        // "Don't have an account?" section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 5),

                            // Switch to register page
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blueAccent.shade700),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // "Or continue with" section
                        Row(
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 20)),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(right: 20)),
                          ],
                        ),

                        // Choose Google or Facebook
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Google button
                            GestureDetector(
                              onTap: null,
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  'lib/images/google.png',
                                  height: 40,
                                ),
                              ),
                            ),

                            const SizedBox(width: 25),

                            // Facebook button
                            GestureDetector(
                              onTap: null,
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  'lib/images/facebook.png',
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
