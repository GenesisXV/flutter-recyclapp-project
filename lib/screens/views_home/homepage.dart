// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:recyclapp/delayed_animation.dart';
// import 'package:recyclapp/views_home/homepage2.dart';
// import 'package:recyclapp/views_home/vente.dart';
// import 'package:recyclapp/views_home/welcome_page.dart';
// import '../main.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home: homepage(),
//     );
//   }
// }

/* Mettre un produit en vente*/

// class AddProduct extends StatefulWidget {
//   @override
//   _AddProductState createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {
//   final key = GlobalKey<FormState>();
//   late String categorie, prix, quantite, description;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Poster un Article"),
//           backgroundColor: Colors.green,
//           actions: [Icon(FontAwesomeIcons.shoppingCart)],
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Form(
//               key: key,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextFormField(
//                     validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
//                     onChanged: (e) => categorie = e,
//                     decoration: InputDecoration(
//                         hintText: "Categorie du Produit",
//                         labelText: "Categorie ",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
//                     onChanged: (e) => categorie = e,
//                     decoration: InputDecoration(
//                         hintText: "Prix du Produit",
//                         labelText: "Prix ",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
//                     onChanged: (e) => categorie = e,
//                     decoration: InputDecoration(
//                         hintText: "Quantite de Produit",
//                         labelText: "Quantite ",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     validator: (e) => e!.isEmpty ? "Remplir ce champ" : null,
//                     onChanged: (e) => categorie = e,
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                         hintText: "Description du Produit",
//                         labelText: "Description ",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                   Wrap(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         color: Colors.green,
//                         child: Icon(FontAwesomeIcons.plusCircle),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (key.currentState!.validate()) {}
//                       },
//                       child:
//                           Text("Enregistrer", style: TextStyle(fontSize: 20)),
//                       style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.resolveWith(
//                               (States) => Colors.green[500])),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
/* Accueil 1*/

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white.withOpacity(0),
//         leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             DelayedAnimation(
//               delay: 1000,
//               child: Container(
//                 height: 550,
//                 child: Image.asset('images/home_2.png'),
//               ),
//             ),
//             DelayedAnimation(
//               delay: 2000,
//               child: Container(
//                   margin: const EdgeInsets.symmetric(
//                     vertical: 0,
//                     horizontal: 30,
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Commençons !",
//                         style: GoogleFonts.poppins(
//                             color: d_green,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/* Accueil 1*/

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white.withOpacity(0),
//         leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => HomePage2()));
//             }),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             DelayedAnimation(
//               delay: 1000,
//               child: Container(
//                 height: 550,
//                 child: Image.asset('images/home_3.png'),
//               ),
//             ),
//             DelayedAnimation(
//               delay: 2000,
//               child: Container(
//                   margin: const EdgeInsets.symmetric(
//                     vertical: 0,
//                     horizontal: 30,
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Bienvenue sur Recyclapp",
//                         style: GoogleFonts.poppins(
//                             color: d_green,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       // IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2()))}, icon: Icons.next_plan_outlined)
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


/* Partie two*/
//   int _selectedIndex = 0;
//   PageController pageController = PageController();

//   void onTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     pageController.animateToPage(index,
//         duration: Duration(milliseconds: 600), curve: Curves.easeIn);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GFG'),
//       ),
//       body: PageView(
//         controller: pageController,
//         children: [
//           Container(color: Colors.red),
//           Container(color: Colors.blue),
//           Container(color: Colors.green),
//           Container(color: Colors.yellow),
//           Container(color: Colors.orange),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.orange,
//         iconSize: 30,
//         onTap: (value) => {},
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.notifications), label: 'Notifications'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
//         ],
//       ),
//     );
//   }

//   // void openVente() {
//   //   Navigator.push(context, MaterialPageRoute(builder: (context) => Vente()));
//   // }
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Botton navigation Example'),
//       ),
//       body: Container(),
//       bottomNavigationBar: BottomNavigationBar(
//         // ignore: prefer_const_literals_to_create_immutables
//         items: [
//           const BottomNavigationBarItem(
//               icon: Icon(Icons.home), backgroundColor: Colors.blue),
//           const BottomNavigationBarItem(
//               icon: Icon(Icons.search), backgroundColor: Colors.blue),
//           const BottomNavigationBarItem(
//               icon: Icon(Icons.person), backgroundColor: Colors.blue),
//         ],
//       ),
//     );
//   }
// }