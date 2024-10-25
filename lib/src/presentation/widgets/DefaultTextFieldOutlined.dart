import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {
  final Function(String text) onChanged;
  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final String? Function(String?)? validator;

  const DefaultTextFieldOutlined(
      {required this.text,
      required this.icon,
      required this.onChanged,
      this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: margin,
      decoration: const BoxDecoration(
          // color: Color.fromRGBO(255, 255, 255, 0.2),
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(15), bottomRight: Radius.circular(15))
          ),
      child: TextFormField(
        onChanged: (text) {
          onChanged(text);
        },
        validator: validator,
        decoration: InputDecoration(
            label: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 0, 79, 115), width: 1)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 1, 207, 255), width: 1)),
            prefixIcon: Container(
              margin: EdgeInsets.only(top: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.white,
                  )
                ],
              ),
            )),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
