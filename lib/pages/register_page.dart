import 'package:flutter/material.dart';
import 'package:looktchop/components/button_component.dart';
import 'package:looktchop/components/checkbox_component.dart';
import 'package:looktchop/components/passwd_textfield_component.dart';
import 'package:looktchop/components/textfield_component.dart';
import 'package:looktchop/pages/login_page.dart';
import 'package:looktchop/utils/extensions.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void showSuccessMessage() {
      String title = "Success";
      String message = "Congratulation, you have completed your registration!";
      // print(message);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            surfaceTintColor: Colors.white,
            // backgroundColor: Colors.white,
            title: Center(
              child: Column(
                children: [
                  Image.asset(
                    'lib/images/check-icon.png',
                    height: 80,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            content: Text(
              message,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            actions: [
              ButtonComponent(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: 'Done',
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 0, 51),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                // color: const Color.fromARGB(255, 237, 0, 51),
                padding: const EdgeInsets.only(left: 30, bottom: 5),
                alignment: Alignment.centerLeft,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Enter your details below & free sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
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

                      // Last name field label
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Your lastname',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // lastname input field
                      TextFieldComponent(
                        hintText: 'John',
                        inputType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill the field";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      // Firstname field label
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Your firstname',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // firstname input field
                      TextFieldComponent(
                        hintText: 'Doe',
                        inputType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please fill the field";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      // Phone field label
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Phone',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Phone input field
                      TextFieldComponent(
                        hintText: '(+237) 698-526-974',
                        inputType: TextInputType.phone,
                        validator: (val) {
                          if (val!.isValidPhone == false) {
                            return "Enter a valid phone";
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
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Password input field
                      PasswordTextFieldComponent(
                        hintText: 'Password',
                        validator: (val) {
                          if (val!.isValidPassword == false) {
                            return "Enter a valid password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),

                      // Confirm password field label
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Confirm password',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Confirm password input field
                      PasswordTextFieldComponent(
                        hintText: 'Confirm password',
                        validator: (val) {
                          if (val!.isValidPassword == false) {
                            return "Enter a valid password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),

                      // Accept terms & conditions
                      const CheckBoxComponent(),
                      const SizedBox(height: 5),

                      // Create account button
                      ButtonComponent(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            showSuccessMessage();
                          }
                        },
                        text: 'Create account',
                      ),
                      const SizedBox(height: 10),

                      // "Don't have an account?" section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          ),
                          const SizedBox(width: 5),

                          // Switch to login page
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueAccent.shade700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
