// import 'package:google_fonts/google_fonts.dart';
// import 'package:recyclapp/delayed_animation.dart';
// import 'package:flutter/material.dart';

// class homepage extends StatefulWidget {

//   @override
//   _homepageState createState() => _homepageState();
// }

// class _homepageState extends State<homepage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }

// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF236046),
//       body: SingleChildScrollView(
//         child: Container(
//           // ignore: prefer_const_constructors
//           margin: EdgeInsets.symmetric(
//             vertical: 60,
//             horizontal: 30,
//           ),
//           child: Column(
//             children: [
//               DelayedAnimation(
//                 delay: 1000,
//                 child: Container(
//                   height: 600,
//                   child: Image.asset('images/recyclapp.png'),
//                 ),
//               ),
//               DelayedAnimation(
//                 delay: 2000,
//                 child: Container(
//                   margin: const EdgeInsets.only(
//                     top: 5,
//                     bottom: 10,
//                   ),
//                   child: Text(
//                     "Si tu tries, t'as tout compris.",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
                
//                   ),
//                 ),
//               ),
//               // DelayedAnimation(
//               //   delay: 3000,
//               //   child: Container(
//               //     width: double.infinity,
//               //     child: ElevatedButton(
//               //       style: ElevatedButton.styleFrom(
//               //           primary: d_green,
//               //           shape: StadiumBorder(),
//               //           padding: EdgeInsets.all(13)),
//               //       child: Text('GET STARTED'),
//               //       onPressed: () {
//               //         Navigator.push(
//               //           context,
//               //           MaterialPageRoute(
//               //             builder: (context) => HomePage(),
//               //           ),
//               //         );
//               //       },
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
