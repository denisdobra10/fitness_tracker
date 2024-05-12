import 'package:fitness_tracker/utils/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserBannerWidget extends StatelessWidget {
  const UserBannerWidget({
    super.key,
    required this.formattedCurrentDate,
    required this.userName,
  });

  final String formattedCurrentDate;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Data de azi
              Text(
                formattedCurrentDate,
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Numele userului
              Text(
                "Buna, $userName",
                style: GoogleFonts.roboto(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  textStyle: const TextStyle(
                    height: 0.00,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              appData['image_path']!,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
