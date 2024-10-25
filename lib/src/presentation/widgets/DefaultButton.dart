import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry margin;

  DefaultButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.margin = const EdgeInsets.only(bottom: 20, left: 20, right: 20),
  });

  @override
  _DefaultButtonState createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _colorAnimation = ColorTween(
      begin: Color(0xFF01CFFF),
      end: Color(0xFFF6DA2D),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressedColor() {
    _controller.forward().then((value) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      margin: widget.margin,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return ElevatedButton(
            onPressed: () {
              _onPressedColor();
              widget.onPressed();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  _colorAnimation.value ?? widget.color,
            ),
            child: InkWell(
              splashColor:
                  Color(0xFFF6DA2D),
              child: Text(
                widget.text,
                style: TextStyle(
                    color: widget.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
