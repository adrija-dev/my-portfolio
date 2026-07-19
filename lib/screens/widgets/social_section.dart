import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/screens/widgets/download_cv_widget.dart';
import 'package:portfolio/screens/widgets/social_widgets.dart';


class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          DownloadCVButton(),
          SizedBox(width: 20,),
          
          Expanded(child: SocialWidget())
          

        ],
      ),

    );
  }
}

