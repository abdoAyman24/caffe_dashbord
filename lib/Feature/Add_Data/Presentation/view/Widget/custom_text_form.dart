import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.hint, required this.onSave, required this.textInputType, });

  final String hint;
  final ValueChanged onSave;
final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'inValied field';
              }
              return null;
            },
            onSaved: onSave,
            keyboardType:textInputType ,
            decoration: InputDecoration(
              
              hint: Text(hint),
              fillColor: const Color.fromARGB(255, 44, 43, 43),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 67, 65, 65),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
