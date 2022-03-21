import 'package:flutter/material.dart';
import 'package:mozolive/Theme/colors.dart';
import 'package:mozolive/utilities/utilities.dart';

class CustomTextButtonIntr extends StatefulWidget {
  CustomTextButtonIntr(
      {required this.onTap,
      required this.isGradient,
      required this.text,
      this.paddingHor,
      this.paddingVert,
      this.height,
      this.fontSize,
      this.width,
      this.isInGridTile = false,
      this.color,
      Key? key})
      : super(key: key);
  final String text;
  final double? paddingVert;
  final double? paddingHor;
  final double? height;
  final double? width;
  final double? fontSize;
  bool isInGridTile;
  final Color? color;
  bool? isGradient = true;
  final VoidCallback onTap;

  @override
  State<CustomTextButtonIntr> createState() => _CustomTextButtonIntrState();
}

class _CustomTextButtonIntrState extends State<CustomTextButtonIntr> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 70, width: widget.width ?? 160,
        margin: EdgeInsets.symmetric(vertical: Utilities.padding / 2),
        // padding: EdgeInsets.symmetric(
        //   vertical: widget.paddingVert ?? Utilities.padding,
        //   horizontal: widget.paddingHor ?? Utilities.padding * 3,
        // ),
        decoration: BoxDecoration(
          color: widget.color ?? textFieldColor,
          gradient: widget.isGradient!
              ? LinearGradient(
                  colors: [btnGradLeft, btnGradRight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
              : null,
          borderRadius: BorderRadius.circular(Utilities.borderRadius),
        ),
        child: Center(
          child: widget.isInGridTile
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: lightTextColor,
                        letterSpacing: 1,
                        fontSize: widget.fontSize ?? 22,
                      ),
                    ),
                    Icon(
                      Icons.thumb_up,
                      color: lightTextColor,
                    )
                  ],
                )
              : Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: lightTextColor,
                    letterSpacing: 1,
                    fontSize: widget.fontSize ?? 22,
                  ),
                ),
        ),
      ),
    );
  }
}
