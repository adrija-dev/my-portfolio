import 'package:flutter/material.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import 'package:portfolio/screens/widgets/download_cv_widget.dart';
import 'package:url_launcher/url_launcher.dart'; 

class SocialTab extends StatelessWidget { 
  final Size size; 
  const SocialTab({super.key, required this.size}); 

  @override 
  Widget build(BuildContext context) { 
    return Padding( 
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05), 
      child: const Wrap( 
        alignment: WrapAlignment.center, 
        crossAxisAlignment: WrapCrossAlignment.center, 
        spacing: 15, 
        runSpacing: 15, 
        children: [ 
          DownloadCVButton(), 
          SocialWidget(), 
        ], 
      ), 
    ); 
  } 
}

class SocialWidget extends StatelessWidget { 
  const SocialWidget({super.key}); 

 Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}


  @override 
  Widget build(BuildContext context) { 
    return Wrap( 
      alignment: WrapAlignment.center, 
      spacing: 12, 
      runSpacing: 12, 
      children: [ 
        SocialIcon(icon: FontAwesomeIcons.linkedinIn, onTap: () => _launchUrl('https://www.linkedin.com/in/adrija-ghosh-999a72300/')), 
        SocialIcon(icon: FontAwesomeIcons.github, onTap: () => _launchUrl('https://github.com/adrija-dev')), 
        SocialIcon(icon: FontAwesomeIcons.envelope, onTap: () => _launchUrl('mailto:adrijaghosh5002@gmail.com')), 
      ], 
    ); 
  } 
} 

class SocialIcon extends StatefulWidget { 
  final FaIconData icon; 
  final VoidCallback onTap; 

  const SocialIcon({super.key, required this.icon, required this.onTap}); 

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool _isHovered = false;

  @override 
  Widget build(BuildContext context) { 
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer( 
        duration: const Duration(milliseconds: 200),
        height: 44, 
        width: 44, 
        decoration: BoxDecoration( 
          color: _isHovered ? Colors.white.withValues(alpha: 0.15) : Colors.transparent, 
          shape: BoxShape.circle, 
          border: Border.all(
            color: _isHovered ? Colors.white : Colors.white.withValues(alpha: 0.4), 
            width: 1.2,
          ), 
        ), 
        child: Center(
          child: IconButton(
            onPressed: widget.onTap,
            padding: EdgeInsets.zero,
            hoverColor: Colors.transparent, 
            icon: FaIcon(widget.icon, color: Colors.white, size: 18), 
          ),
        ),
      ),
    ); 
  } 
}
