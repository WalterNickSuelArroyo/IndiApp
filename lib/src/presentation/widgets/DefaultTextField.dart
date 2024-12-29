import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  String text;
  String? initialValue;
  Function(String text) onChanged;
  IconData icon;
  EdgeInsetsGeometry margin;
  String? Function(String?)? validator;
  Color backgroundColor;
  TextInputType keyboardType;

  DefaultTextField({
    required this.text,
    required this.icon,
    required this.onChanged,
    this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
    this.validator,
    this.backgroundColor = Colors.white,
    this.initialValue,
    this.keyboardType = TextInputType.text
    }
  );
      

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: TextFormField(
        onChanged: (text) {
          onChanged(text);
        },
        style: TextStyle(
          fontSize: 18
        ),
        initialValue: initialValue,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            label: Text(
              text,
              style: TextStyle(
                fontSize: 13
              ),
            ),
            border: InputBorder.none,
            prefixIcon: Container(
              margin: EdgeInsets.only(top: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Icon(icon),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
