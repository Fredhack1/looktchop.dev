import 'package:flutter/material.dart';

class PasswordTextFieldComponent extends StatefulWidget {
  final String hintText;
  final String? Function(String?) validator;

  const PasswordTextFieldComponent({
    super.key,
    required this.hintText,
    required this.validator,
  });

  @override
  State<PasswordTextFieldComponent> createState() =>
      _PasswordTextFieldComponentState();
}

class _PasswordTextFieldComponentState
    extends State<PasswordTextFieldComponent> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        obscureText: !showPassword,
        decoration: InputDecoration(
          suffixIcon: showPassword
              // ignore: dead_code
              ? IconButton(
                  icon: Icon(
                    Icons.visibility_off,
                    color: Colors.grey[800],
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.grey[800],
                  ),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(color: Color.fromARGB(255, 97, 97, 97)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(color: Color.fromARGB(255, 66, 66, 66)),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            borderSide: BorderSide(color: Color.fromARGB(255, 237, 0, 51)),
          ),
          errorStyle: const TextStyle(color: Color.fromARGB(255, 237, 0, 51)),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
