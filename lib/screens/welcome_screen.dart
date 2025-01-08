import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Couleur de fond blanche
      body: Center(
        child: SingleChildScrollView(
          // Rend la page scrollable
          child: Container(
            width: screenWidth * 0.97, // 90% de la largeur de l'écran
            height: screenHeight * 0.9, // 90% de la hauteur de l'écran
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
            decoration: BoxDecoration(
              color: const Color(0xFF9295B3), // Couleur violette
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Ombre légère
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image "Bienvenue à H.M"
                Image.asset(
                  'assets/images/bienvenue_hm.png',
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.15,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 32),

                // Champ de saisie
                TextField(
                  style: const TextStyle(
                    color: Color(0xFF191A2D),
                    fontFamily: "Orbitron",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "Entrez votre pseudo-nom...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    hintStyle: const TextStyle(
                      color: Color(0xFF191A2D),
                      fontFamily: "Orbitron",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Texte d'instruction
                const Text(
                  "Veuillez choisir ce que vous souhaitez faire",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF191A2D),
                    fontFamily: "Orbitron",
                    letterSpacing: 0.05,
                  ),
                ),

                const SizedBox(height: 32),

                // Les deux boutons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                      context,
                      imagePath: 'assets/images/salon_coiffure.png',
                      label: "Salon de coiffure",
                      onTap: () {
                        Navigator.pushNamed(context, '/choose_post');
                      },
                    ),
                    const SizedBox(width: 6),
                    _buildButton(
                      context,
                      imagePath: 'assets/images/restaurant.png',
                      label: "Restaurant",
                      onTap: () {
                        Navigator.pushNamed(context, '/food_order');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    // Obtenons les dimensions de l'écran
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adaptons les tailles en fonction de l'écran
    final buttonWidth =
        screenWidth * 0.42; // Largeur du bouton = 40% de l'écran
    final buttonHeight =
        screenHeight * 0.35; // Hauteur du bouton = 35% de l'écran
    final imageHeight =
        buttonHeight * 0.65; // Taille de l'image (65% de la hauteur du bouton)

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        padding: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Image.asset(
              imagePath,
              width: buttonWidth *
                  0.9, // Taille de l'image (80% de la largeur du bouton)
              height: imageHeight,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xFF191A2D),
                fontFamily: "Orbitron",
                letterSpacing: 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
