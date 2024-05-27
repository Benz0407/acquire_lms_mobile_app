import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/bookmark.png'),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/Logo.png'),
                const Text(
                  'A', 
                  style: TextStyle(
                  color: Color(0xFFCC0000),
                  fontSize: 50,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w700,
                  height: 0.02,
                  ),
                ), 
                const Text(
                  'CQUIRE', 
                  style: TextStyle(
                  color: Color(0xFF3D3D3D),
                  fontSize: 50,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w700,
                  height: 0.02,
                  ),
                )
              ],
            ), 
        
          ],
        ),
      )
    ); 
  }
}