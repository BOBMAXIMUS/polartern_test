import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final List<String> avatars;

  const AvatarWidget({super.key, required this.avatars});

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
                Icons.person_outline,
                size: 20,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 5),
              Text(
                "Hosts",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 32,
            child: Stack(
              children: avatars.asMap().entries.map(
                (entry) {
                  int idx = entry.key;
                  String avatar = entry.value;
                  return Positioned(
                    left: idx * 22.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(avatar),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
