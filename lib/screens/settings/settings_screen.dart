import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/screens/premium/premium_screen.dart';
import 'package:dream_diary/widget/out_shadow_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  "Settings",
                  style: GoogleFonts.epilogue(
                    textStyle: AppStyles.boldWhiteHeading,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.bgElements
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Reset Progress", style: GoogleFonts.roboto(
                        textStyle: AppStyles.regularWhiteText14,
                      ),),
                      const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.secondColor,)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.bgElements
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Support", style: GoogleFonts.roboto(
                        textStyle: AppStyles.regularWhiteText14,
                      ),),
                      const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.secondColor,)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.bgElements
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Terms of use", style: GoogleFonts.roboto(
                        textStyle: AppStyles.regularWhiteText14,
                      ),),
                      const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.secondColor,)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.bgElements
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Privacy policy", style: GoogleFonts.roboto(
                        textStyle: AppStyles.regularWhiteText14,
                      ),),
                      const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.secondColor,)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.bgElements
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Restore purchases", style: GoogleFonts.roboto(
                        textStyle: AppStyles.regularWhiteText14,
                      ),),
                      const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.secondColor,)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumScreen())),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondColor,
                          boxShadow: OutShadowWidget().showOutShadow(),
                        ),
                        child: Text("Get Premium", style: GoogleFonts.mulish(
                          textStyle: AppStyles.regularHeading18,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Positioned(
                          bottom: 8,
                          right: 10,
                          child: Image.asset(
                            'assets/images/big_star.png',
                            scale: 1.5,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


