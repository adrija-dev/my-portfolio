import 'package:flutter/material.dart'; 
import 'package:portfolio/screens/widgets/download_cv_widget.dart'; 
import 'package:portfolio/screens/widgets/social_widgets.dart'; 
import 'package:portfolio/screens/widgets/text_widgets.dart'; 
import 'package:simple_gradient_text/simple_gradient_text.dart'; 

class HeaderTextWidget extends StatelessWidget { 
  final Size size; 
  const HeaderTextWidget({super.key, required this.size}); 

  @override 
  Widget build(BuildContext context) { 
    return Column( 
      crossAxisAlignment: size.width > 600 ? CrossAxisAlignment.start : CrossAxisAlignment.center, 
      children: [ 
        TextWidget( 
          sSize: size, 
          text: "Hi, I'm Adrija Ghosh", 
          color: Colors.white, 
          size: 28, 
          fw: FontWeight.bold, 
          alignment: size.width > 600 ? TextAlign.start : TextAlign.center, 
        ), 
        const SizedBox(height: 12), 
        GradientTextWidget(size: size, alignment: TextAlign.center, text1: "Flutter Developer", text2: "BCA Student"), 
        const SizedBox(height: 24), 
        SizedBox( 
          width: size.width > 600 ? size.width * 0.5 : size.width * 0.85, 
          child: TextWidget( 
            sSize: size, 
            alignment: size.width > 600 ? TextAlign.start : TextAlign.center, 
            text: "Passionate Flutter developer focused on building beautiful, responsive, and user-friendly cross-platform applications. I enjoy turning ideas into modern digital experiences.", 
            size: 15, 
            color: Colors.white.withValues(alpha: 0.75), 
            fw: FontWeight.normal, 
          ), 
        ), 
      ], 
    ); 
  } 
} 

class GradientTextWidget extends StatelessWidget { 
  final Size size; 
  final TextAlign? alignment; 
  final String? text1; 
  final String? text2; 

  const GradientTextWidget({super.key, required this.size, this.alignment, this.text1, this.text2}); 

  @override 
  Widget build(BuildContext context) { 
    final double textFontSize = size.width > 950 ? 42 : (size.width > 600 ? 34 : 28);
    const List<Color> gradientColors = [Colors.white, Color(0xFFFFB300)]; 
    
    final TextStyle customTextStyle = TextStyle( 
      fontSize: textFontSize, 
      fontWeight: FontWeight.bold, 
      fontFamily: 'Poppins', 
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: size.width > 600 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        if (text1 != null && text1!.isNotEmpty)
          GradientText(
            text1!,
            textAlign: size.width < 600 ? alignment : null,
            colors: gradientColors,
            style: customTextStyle,
          ),
        if (size.width < 600 && text1 != null && text2 != null)
          const SizedBox(height: 6),
        if (text2 != null && text2!.isNotEmpty)
          GradientText(
            text2!,
            textAlign: size.width < 600 ? alignment : null,
            colors: gradientColors,
            style: customTextStyle,
          ),
      ],
    ); 
  } 
} 

class SocialLarge extends StatelessWidget { 
  final Size size; 
  const SocialLarge({super.key, required this.size}); 

  @override 
  Widget build(BuildContext context) { 
    return SizedBox( 
      width: size.width * 0.5, 
      child: const Row( 
        mainAxisAlignment: MainAxisAlignment.start, 
        children: [ 
          DownloadCVButton(), 
          SizedBox(width: 20), 
          SocialWidget(), 
        ], 
      ), 
    ); 
  } 
}
