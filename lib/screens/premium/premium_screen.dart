import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/widget/out_shadow_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumScreen extends StatelessWidget {
  PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/main_bg.png", fit: BoxFit.cover)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Premium",
                      style: GoogleFonts.epilogue(
                        textStyle: AppStyles.boldWhiteHeading,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close_outlined, color: AppColors.white),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset('assets/images/premium.png'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/star.png'),
                    const SizedBox(width: 8),
                    Text('Unlimited interpretations of your dreams',
                        style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/star.png'),
                    const SizedBox(width: 8),
                    Text('Access to Techniques', style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/star.png'),
                    const SizedBox(width: 8),
                    Text('No advertising', style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 24),
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
                        child: Text(
                          "Buy Premium for \$0.99",
                          style: GoogleFonts.mulish(textStyle: AppStyles.regularHeading18, fontWeight: FontWeight.bold),
                        ),
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
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Privacy policy',
                        style: GoogleFonts.mulish(
                          textStyle: AppStyles.regularWhiteText12,
                        )),
                    Text('Restore purchases',
                        style: GoogleFonts.mulish(
                          textStyle: AppStyles.regularWhiteText12,
                        )),
                    Text('Terms of use',
                        style: GoogleFonts.mulish(
                          textStyle: AppStyles.regularWhiteText12,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
