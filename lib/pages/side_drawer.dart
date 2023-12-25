import 'package:flutter/material.dart';
import 'package:optimum/app_colors.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/search_white.png"),
                const SizedBox(width: 16.0),
                const Text(
                  "Find Therapists",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      height: 1.4),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/reports.png"),
                const SizedBox(width: 16.0),
                const Text(
                  "Reports",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      height: 1.4),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/notifications_white.png"),
                const SizedBox(width: 16.0),
                const Text(
                  "Notifications",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      height: 1.4),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/policy.png"),
                const SizedBox(width: 16.0),
                const Text(
                  "Data & Privacy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      height: 1.4),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/support.png"),
                const SizedBox(width: 16.0),
                const Text(
                  "Help & Support",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
