import 'package:flutter/material.dart';

class CheckBoxComponent extends StatefulWidget {
  const CheckBoxComponent({super.key});

  @override
  State<CheckBoxComponent> createState() => _CheckBoxComponentState();
}

class _CheckBoxComponentState extends State<CheckBoxComponent> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        'By creating an account you have to agree with our terms and conditions.',
        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
      ),
      value: _isChecked,
      onChanged: (bool? newValue) {
        setState(() {
          _isChecked = newValue ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity
          .leading, // Pour positionner la case avant le texte
    );
  }
}
