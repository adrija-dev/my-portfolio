import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

class DownloadCVButton extends StatefulWidget { 
  const DownloadCVButton({super.key});

  @override
  State<DownloadCVButton> createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<DownloadCVButton> {
  bool _isHovered = false;

 Future<void> _downloadCV() async {
  final Uri url = Uri.parse('resume.pdf'); 
  
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not open CV');
  }
}


  @override 
  Widget build(BuildContext context) { 
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell( 
        onTap: _downloadCV, 
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer( 
          duration: const Duration(milliseconds: 200),
          height: 50, 
          width: 250, 
          decoration: BoxDecoration( 
            color: _isHovered ? Colors.white.withValues(alpha: 0.1) : Colors.transparent, 
            borderRadius: BorderRadius.circular(20), 
            border: Border.all(color: Colors.white, width: 1.5), 
          ), 
          child: const Row( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [ 
              Text( 
                "Download CV", 
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15), 
              ), 
              SizedBox(width: 12), 
              FaIcon( 
                FontAwesomeIcons.download, 
                color: Colors.white, 
                size: 16, 
              ), 
            ], 
          ), 
        ), 
      ),
    ); 
  } 
}
