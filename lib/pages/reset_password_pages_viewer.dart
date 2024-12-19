import 'package:flutter/material.dart';
import 'package:looktchop/pages/reset_password_screens/forgot_password_screen.dart';
import 'package:looktchop/pages/reset_password_screens/otp_verification_sreen.dart';
import 'package:looktchop/pages/reset_password_screens/set_new_password_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ResetPasswordPagesViewer extends StatefulWidget {
  const ResetPasswordPagesViewer({super.key});

  @override
  State<ResetPasswordPagesViewer> createState() =>
      _ResetPasswordPagesViewerState();
}

class _ResetPasswordPagesViewerState extends State<ResetPasswordPagesViewer> {
  // controller to keep track of which page we're on
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ForgotPasswordScreen(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
              OtpVerificationScreen(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
              ),
              const SetNewPasswordScreen(),
            ],
          ),
          // Dot indicators
          Container(
            alignment: const Alignment(0, 0.85),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const SlideEffect(
                  activeDotColor: Color.fromARGB(255, 237, 0, 51),
                  dotColor: Colors.black,
                  dotWidth: 50.0,
                  dotHeight: 5.0,
                  radius: 2.0,
                  spacing: 65.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
