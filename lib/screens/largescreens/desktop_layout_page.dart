import 'package:flutter/material.dart'; 
import 'package:portfolio/constants/colors.dart'; 
import 'package:portfolio/screens/widgets/count_container_widgets.dart'; 
import 'package:portfolio/screens/widgets/header_text_widget.dart'; 
import 'package:portfolio/screens/widgets/project_showcase_widget.dart';
import 'package:portfolio/screens/widgets/rotating_image_widget.dart'; 
import 'package:portfolio/screens/widgets/skills_section_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart'; 

class DesktopLayout extends StatefulWidget { 
  const DesktopLayout({super.key}); 

  @override 
  State<DesktopLayout> createState() => _DesktopLayoutState(); 
} 

class _DesktopLayoutState extends State<DesktopLayout> { 
  @override 
  Widget build(BuildContext context) { 
    final Size size = MediaQuery.of(context).size; 

    return Scaffold( 
      body: Container( 
        width: double.infinity, 
        decoration: const BoxDecoration( 
          gradient: LinearGradient( 
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight, 
            colors: [
              Color.fromARGB(255, 103, 142, 192), 
              Color.fromARGB(255, 159, 106, 219)
            ], 
          ), 
        ), 
        child: SingleChildScrollView( 
          child: Padding( 
            padding: EdgeInsets.symmetric( 
              horizontal: size.width * 0.06, 
              vertical: size.height * 0.12, 
            ), 
            child: Column( 
              children: [ 
                SizedBox( 
                  width: double.infinity, 
                  child: Row( 
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: [ 
                      Expanded( 
                        flex: 5, 
                        child: Column( 
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [ 
                            HeaderTextWidget(size: size), 
                            const SizedBox(height: 25), 
                            SocialLarge(size: size), 
                          ], 
                        ), 
                      ), 
                      SizedBox(width: size.width * 0.05), 
                      const Expanded( 
                        flex: 4, 
                        child: Center( 
                          child: RotatingImageContainer(), 
                        ), 
                      ), 
                    ], 
                  ), 
                ), 
                SizedBox(height: size.height * 0.12), 
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                  children: [ 
                    CountWidget( 
                      size: size, 
                      text1: "2+", 
                      text2: "Projects", 
                      text3: "Completed", 
                    ), 
                    CountWidget( 
                      size: size, 
                      text1: "10+", 
                      text2: "Technologies", 
                      text3: "Learned", 
                    ), 
                    CountWidget( 
                      size: size, 
                      text1: "100%", 
                      text2: "Passion", 
                      text3: "For Coding", 
                    ), 
                  ], 
                ), 
                SizedBox(height: size.height * 0.12), 
                Container( 
                  width: double.infinity, 
                  color: AppColors.ebony, 
                  padding: EdgeInsets.symmetric( 
                    vertical: size.height * 0.06, 
                    horizontal: size.width * 0.04, 
                  ), 
                  child: Column( 
                    children: [ 
                      GradientText( 
                        "Services", 
                        style: TextStyle( 
                          fontSize: size.width * 0.03, 
                          fontFamily: "Poppins", 
                          fontWeight: FontWeight.bold, 
                        ), 
                        colors: const [Colors.white, Colors.blueAccent], 
                      ), 
                      SizedBox(height: size.height * 0.03), 
                      SizedBox( 
                        width: size.width * 0.6, 
                        child: Text( 
                          "I build modern, responsive, and user-friendly Flutter applications with clean UI and smooth user experiences.", 
                          textAlign: TextAlign.center, 
                          style: TextStyle( 
                            color: Colors.white70, 
                            fontSize: size.width * 0.012, 
                            fontFamily: "Poppins", 
                          ), 
                        ), 
                      ), 
                      SizedBox(height: size.height * 0.05), 
                      ProjectShowcaseWidget(size: size), 
                      const SizedBox(height: 40), 
                      SkillsSectionWidget(size: size), 
                    ], 
                  ), 
                ), 
              ], 
            ), 
          ), 
        ), 
      ), 
    ); 
  } 
}
