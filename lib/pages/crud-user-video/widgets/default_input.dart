import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final String label;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final String initialValue;

  const DefaultInput(
      {Key key, this.initialValue, this.label, this.validator, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: this.label,
      ),
      validator: this.validator,
      onSaved: this.onSaved,
    );
  }
}
