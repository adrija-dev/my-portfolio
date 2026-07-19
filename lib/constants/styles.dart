import 'package:flutter/material.dart'; 

class Styles {
  Styles._(); 

  static const BoxDecoration gradientDecoration = BoxDecoration( 
    gradient: LinearGradient( 
      begin: Alignment.topLeft, 
      end: Alignment.bottomRight, 
      colors: [ 
        Color.fromARGB(255, 141, 78, 184), 
        Color.fromARGB(255, 187, 85, 207), 
      ], 
    ), 
  ); 
}
