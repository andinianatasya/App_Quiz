import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String optionText;
  final VoidCallback onTap;
  final Color color;
  final IconData? icon;
  final Color iconColor;

  const AnswerOption({
    Key? key,
    required this.optionText,
    required this.onTap,
    this.color = Colors.white,
    this.icon,
    this.iconColor = Colors.transparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: screenWidth * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  optionText,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}