import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../app/app_routes.dart';

class LoadingScreen extends StatefulWidget {
  // Changement ici
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Redirige après 3 secondes
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Couleur de fond
        color: const Color(0xFF9295B3),
        child: Stack(
          children: [
            // Demi-cercle en haut à droite
            Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                'assets/images/rectangle_haut.png', // Assurez-vous d'avoir l'image dans ce chemin
                width: 250,
                height: 250,
              ),
            ),
            // Demi-cercle en bas à gauche
            Positioned(
              bottom: -50,
              left: -50,
              child: Image.asset(
                'assets/images/rectangle_bas.png', // Assurez-vous d'avoir l'image dans ce chemin
                width: 324,
                height: 326,
              ),
            ),
            // Contenu principal au centre
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo principal
                  Image.asset(
                    'assets/images/logo_hm.png', // Chemin de votre logo
                    width: 337,
                    height: 218,
                  ),
                  const SizedBox(
                      height:
                          20), // Correction de l'espace entre le logo et l'animation
                  // Animation de chargement
                  const SpinKitThreeBounce(
                    color: Color(0xFF191A2D),
                    size: 25.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
