import 'package:flutter/material.dart';
import 'package:looktchop/components/button_component.dart';
import 'package:looktchop/components/otp_fields_component.dart';

class OtpVerificationScreen extends StatelessWidget {
  final Function()? onTap;
  const OtpVerificationScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    void showSuccessMessage() {
      String title = "Success";
      String message = "The code has been sent!";
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
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            actions: [
              ButtonComponent(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: 'OK',
              )
            ],
          );
        },
      );
    }

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
                  'Reset password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                padding: const EdgeInsets.only(bottom: 0),
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

                    // We have sent a code to (+237) 698-526-974
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'We have sent a code to (+237) 698-526-974',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // OTP input fields
                    const Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OtpFieldsComponent(),
                          OtpFieldsComponent(),
                          OtpFieldsComponent(),
                          OtpFieldsComponent(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // login button
                    ButtonComponent(
                      onTap: onTap,
                      text: 'Continue',
                    ),
                    const SizedBox(height: 15),

                    // "Don't have an account?" section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn\'t receive the SMS?',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                        const SizedBox(width: 5),

                        // Switch to register page
                        GestureDetector(
                          onTap: () {
                            showSuccessMessage();
                          },
                          child: Text(
                            'Click here',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueAccent.shade700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // "Back to Login" section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                    //   Expanded(
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(bottom: 50),
                    //       child: Row(
                    //         crossAxisAlignment: CrossAxisAlignment.end,
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           Container(
                    //             width: 50,
                    //             height: 5,
                    //             decoration: const BoxDecoration(
                    //               color: Colors.black,
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(2)),
                    //             ),
                    //           ),
                    //           Container(
                    //             width: 50,
                    //             height: 5,
                    //             decoration: const BoxDecoration(
                    //               color: Color.fromARGB(255, 237, 0, 51),
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(2)),
                    //             ),
                    //           ),
                    //           Container(
                    //             width: 50,
                    //             height: 5,
                    //             decoration: const BoxDecoration(
                    //               color: Colors.black,
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(2)),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
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
