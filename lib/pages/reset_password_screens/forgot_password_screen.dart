import 'package:flutter/material.dart';
import 'package:looktchop/components/button_component.dart';
import 'package:looktchop/components/textfield_component.dart';
import 'package:looktchop/utils/extensions.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final Function()? onTap;
  const ForgotPasswordScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 0),
          padding: const EdgeInsets.only(top: 50, bottom: 0),
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(begin: AlignmentDirectional.bottomEnd, colors: [
              Colors.white,
              Color.fromARGB(255, 237, 0, 51),
            ]),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                // color: const Color.fromARGB(255, 237, 0, 51),
                padding: const EdgeInsets.only(left: 30, bottom: 30),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height - 165,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 40)),

                    // No worries, we'll send you reset instructions.
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'No worries, we\'ll send you reset instructions.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Phone field label
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Phone',
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Phone input field
                    TextFieldComponent(
                      hintText: 'Enter your phone number...',
                      inputType: TextInputType.phone,
                      validator: (val) {
                        if (val!.isValidPhone == false) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    // Reset password button
                    ButtonComponent(
                      onTap: onTap,
                      text: 'Reset password',
                    ),
                    const SizedBox(height: 25),

                    // "Don't have an account?" section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Switch to register page
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.arrow_back),
                              const SizedBox(width: 5),
                              Text(
                                'Back to login',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Progress bar
                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(bottom: 50),
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.end,
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         Container(
                    //           width: 50,
                    //           height: 5,
                    //           decoration: const BoxDecoration(
                    //             color: Color.fromARGB(255, 237, 0, 51),
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(2)),
                    //           ),
                    //         ),
                    //         Container(
                    //           width: 50,
                    //           height: 5,
                    //           decoration: const BoxDecoration(
                    //             color: Colors.black,
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(2)),
                    //           ),
                    //         ),
                    //         Container(
                    //           width: 50,
                    //           height: 5,
                    //           decoration: const BoxDecoration(
                    //             color: Colors.black,
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(2)),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
