import 'package:flutter/material.dart'; 
import 'package:portfolio/screens/home_page.dart'; 

void main() { 
  runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 

  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      title: 'Adrija Ghosh Portfolio',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), 
        useMaterial3: true, 
      ), 
      home: const HomePage(), 
    ); 
  } 
}
