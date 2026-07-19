import 'package:flutter/material.dart'; 
import 'package:portfolio/constants/styles.dart'; 
import 'package:portfolio/screens/widgets/count_container_widgets.dart'; 
import 'package:portfolio/screens/widgets/header_text_widget.dart'; 
import 'package:portfolio/screens/widgets/project_showcase_widget.dart';
import 'package:portfolio/screens/widgets/rotating_image_widget.dart'; 
import 'package:portfolio/screens/widgets/skills_section_widget.dart';
import 'package:portfolio/screens/widgets/social_widgets.dart'; 

class MobileLayout extends StatefulWidget { 
  const MobileLayout({super.key}); 

  @override 
  State<MobileLayout> createState() => _MobileLayoutState(); 
} 

class _MobileLayoutState extends State<MobileLayout> { 
  @override 
  Widget build(BuildContext context) { 
    final Size size = MediaQuery.of(context).size; 

    return Scaffold( 
      body: Container( 
        height: double.infinity, 
        width: double.infinity, 
        decoration: Styles.gradientDecoration, 
        child: SingleChildScrollView( 
          child: Container( 
            margin: EdgeInsets.symmetric(vertical: size.height * 0.12), 
            child: Column( 
              children: [ 
                const Center(
                  child: RotatingImageContainer(),
                ), 
                SizedBox(height: size.width * 0.09), 
                Padding( 
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05), 
                  child: Column( 
                    children: [ 
                      HeaderTextWidget(size: size), 
                      const SizedBox(height: 20), 
                      SocialTab(size: size), 
                    ], 
                  ), 
                ), 
                SizedBox(height: size.width * 0.09), 
                Container( 
                  width: size.width, 
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.05), 
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.center, 
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
                        color:const Color.fromARGB(255, 83, 33, 124), 
                        indent: size.width * 0.05, 
                        endIndent: size.width * 0.05, 
                      ), 
                      const SizedBox(height: 20), 
                      CountWidget( 
                        size: size, 
                        text1: "BCA", 
                        text2: "Current", 
                        text3: "Student", 
                      ), 
                      const SizedBox(height: 20), 
                      Divider( 
                        color: const Color.fromARGB(255, 83, 33, 124), 
                        indent: size.width * 0.05, 
                        endIndent: size.width * 0.05, 
                      ), 
                      const SizedBox(height: 20), 
                      CountWidget( 
                        size: size, 
                        text1: "REST", 
                        text2: "API", 
                        text3: "Integration", 
                      ), 
                    ], 
                  ), 
                ), 
                SizedBox(height: size.width * 0.09), 
                ProjectShowcaseWidget(size: size), 
                const SizedBox(height: 20), 
                SkillsSectionWidget(size: size), 
              ], 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
}
