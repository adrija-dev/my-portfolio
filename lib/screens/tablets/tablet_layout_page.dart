import 'package:flutter/material.dart'; 
import 'package:portfolio/constants/colors.dart'; 
import 'package:portfolio/constants/styles.dart'; 
import 'package:portfolio/screens/widgets/count_container_widgets.dart'; 
import 'package:portfolio/screens/widgets/header_text_widget.dart'; 
import 'package:portfolio/screens/widgets/project_showcase_widget.dart';
import 'package:portfolio/screens/widgets/rotating_image_widget.dart'; 
import 'package:portfolio/screens/widgets/skills_section_widget.dart';
import 'package:portfolio/screens/widgets/social_widgets.dart'; 

class TabletLayout extends StatefulWidget { 
  const TabletLayout({super.key}); 

  @override 
  State<TabletLayout> createState() => _TabletLayoutState(); 
} 

class _TabletLayoutState extends State<TabletLayout> { 
  @override 
  Widget build(BuildContext context) { 
    final Size size = MediaQuery.of(context).size; 

    return Scaffold( 
      body: Container( 
        width: double.infinity, 
        height: double.infinity, 
        decoration: Styles.gradientDecoration, 
        child: SingleChildScrollView( 
          child: Container( 
            margin: EdgeInsets.symmetric(vertical: size.height * 0.18), 
            child: Column( 
              children: [ 
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [ 
                    Column( 
                      children: [ 
                        const RotatingImageContainer(), 
                        SizedBox(height: size.width * 0.09), 
                        HeaderTextWidget(size: size), 
                        const SizedBox(height: 20), 
                        SocialTab(size: size), 
                      ], 
                    ), 
                  ], 
                ), 
                const SizedBox(height: 20), 
                Container( 
                  width: size.width, 
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05), 
                  child: Column( 
                    children: [ 
                      const SizedBox(height: 20), 
                      CountWidget( 
                        size: size, 
                        text1: "2+", 
                        text2: "Projects", 
                        text3: "Completed", 
                      ), 
                      const SizedBox(height: 20), 
                      Divider( 
                        color: AppColors.paleSlate, 
                        indent: size.width * 0.05, 
                        endIndent: size.width * 0.05, 
                      ), 
                    ], 
                  ), 
                ), 
                ProjectShowcaseWidget(size: size), 
                const SizedBox(height: 30), 
                SkillsSectionWidget(size: size), 
              ], 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
}
