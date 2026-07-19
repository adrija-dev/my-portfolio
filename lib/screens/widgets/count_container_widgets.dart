import 'package:flutter/material.dart'; 

class CountWidget extends StatelessWidget { 
  final Size size; 
  final String text1; 
  final String text2; 
  final String text3; 

  const CountWidget({
    super.key, 
    required this.size, 
    required this.text2, 
    required this.text3, 
    required this.text1,
  }); 

  @override 
  Widget build(BuildContext context) { 
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center, 
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [ 
        Text( 
          text1, 
          style: TextStyle( 
            color: Colors.white, 
            fontFamily: 'Poppins', 
            fontWeight: FontWeight.w600, 
            fontSize: size.width > 600 ? size.width * 0.025 : 24,
          ), 
        ), 
        const SizedBox(width: 10), 
        Column( 
          crossAxisAlignment: CrossAxisAlignment.start, 
          mainAxisSize: MainAxisSize.min,
          children: [ 
            Text( 
              text2, 
              style: const TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 12), 
            ), 
            Text( 
              text3, 
              style: const TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 12), 
              ), 
          ], 
        ) 
      ], 
    ); 
  } 
}
