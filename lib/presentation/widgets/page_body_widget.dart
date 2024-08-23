import 'package:flutter/material.dart';

import 'avatar_display_widget.dart';
import 'page_title_and_share_widget.dart';
import 'title_info_widget.dart';

class PageBodyWidget extends StatelessWidget {
  const PageBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShareScreenWidget(),
              const SizedBox(height: 10),
              const Wrap(
                spacing: 16.0,
                children: [
                  TitleAndInfoWidget(
                    icon: Icons.access_time,
                    title: "Date and Time",
                    subTitle: "3rd Feb, '24 - 6:00PM",
                  ),
                  TitleAndInfoWidget(
                    icon: Icons.account_balance_wallet_outlined,
                    title: "Cost",
                    subTitle: "₹400",
                  ),
                  TitleAndInfoWidget(
                    icon: Icons.location_on_outlined,
                    title: "Location",
                    subTitle: "Denpasar → Jakarta",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              const AvatarWidget(
                avatars: [
                  'assets/avatar/avatar_1.png',
                  'assets/avatar/avatar_2.png',
                  'assets/avatar/avatar_3.png',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
