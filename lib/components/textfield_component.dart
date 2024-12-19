import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType? inputType;

  const TextFieldComponent({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        keyboardType: inputType,
        decoration: InputDecoration(
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
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
