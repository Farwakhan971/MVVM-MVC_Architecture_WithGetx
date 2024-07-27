import 'package:flutter/material.dart';
import 'package:mvvm_mvc/res/colors/app_color.dart';
class RoundButton extends StatefulWidget {
  final String buttonText;
  final Color buttonColor, textColor;
  final double height, width;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({
    required this.buttonText,
    required this.onPress,
    this.height = 100,
    this.width = 100,
    this.buttonColor = AppColors.blackColor,
    this.textColor = AppColors.whiteColor,
    this.loading = false,

    super.key});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: widget.loading ? Center(child: CircularProgressIndicator()):
        Center(child: Text(widget.buttonText, style: TextStyle(color: widget.textColor),)),

      ),
    );
  }
}
