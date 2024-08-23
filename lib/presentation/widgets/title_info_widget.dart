import 'package:flutter/material.dart';

class TitleAndInfoWidget extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? subTitle;

  const TitleAndInfoWidget({this.icon, this.title, this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 4.0,
        bottom: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon ?? Icons.date_range,
                size: 20,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 5),
              Text(
                title ?? "Placeholder",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Text(
            subTitle ?? "Placeholder",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}
