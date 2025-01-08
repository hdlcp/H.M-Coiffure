import 'package:flutter/material.dart';

class ChoosePostScreen extends StatefulWidget {
  const ChoosePostScreen({super.key});

  @override
  State<ChoosePostScreen> createState() => _ChoosePostScreenState();
}

class _ChoosePostScreenState extends State<ChoosePostScreen> {
  // Les files d'attente pour chaque utilisateur
  final Map<String, int> _queues = {
    'Roméo': 30,
    'Jean': 10,
    'Simon': 25,
    'Patricia': 25,
  };

  void _incrementQueue(BuildContext context, String name) {
    setState(() {
      _queues[name] = _queues[name]! + 1;
    });

    final int newPosition = _queues[name]!;

    // Afficher le message de confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Vous avez été bien enregistré chez $name en position $newPosition.",
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Orbitron",
          ),
        ),
        backgroundColor: const Color(0xFF191A2D),
        duration: const Duration(seconds: 3),
      ),
    );

    // Redirection vers un autre écran après une petite attente
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              const Text(
                "Qui souhaitez-vous choisir pour votre soin ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Orbitron",
                  color: Color(0xFF191A2D),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  _buildPostCard(
                    context,
                    imagePath: 'assets/images/romeo.png',
                    name: 'Roméo',
                    speciality: 'coiffure',
                    clientsInQueue: _queues['Roméo']!,
                    onIconTap: () => _incrementQueue(context, 'Roméo'),
                  ),
                  _buildPostCard(
                    context,
                    imagePath: 'assets/images/jean.png',
                    name: 'Jean',
                    speciality: 'coiffure',
                    clientsInQueue: _queues['Jean']!,
                    onIconTap: () => _incrementQueue(context, 'Jean'),
                  ),
                  _buildPostCard(
                    context,
                    imagePath: 'assets/images/simon.png',
                    name: 'Simon',
                    speciality: 'coiffure',
                    clientsInQueue: _queues['Simon']!,
                    onIconTap: () => _incrementQueue(context, 'Simon'),
                  ),
                  _buildPostCard(
                    context,
                    imagePath: 'assets/images/patricia.png',
                    name: 'Patricia',
                    speciality: 'Manucure',
                    clientsInQueue: _queues['Patricia']!,
                    onIconTap: () => _incrementQueue(context, 'Patricia'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard(
    BuildContext context, {
    required String imagePath,
    required String name,
    required String speciality,
    required int clientsInQueue,
    required VoidCallback onIconTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01), // Espacement vertical dynamique
      width: screenWidth * 0.95,
      height: screenHeight * 0.18, // Hauteur proportionnelle
      decoration: BoxDecoration(
        color: const Color(0xFF9295B3),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(screenWidth * 0.045),
          bottomRight: Radius.circular(screenWidth * 0.045),
        ), // Bordures arrondies dynamiques
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: screenWidth * 0.03, // Rayon de flou proportionnel
            offset: Offset(0, screenHeight * 0.01), // Ombre proportionnelle
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              // Image avec texte superposé
              Stack(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      imagePath,
                      width: screenWidth * 0.3,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: const Color(0xFF191A2D).withOpacity(0.5),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.005,
                      ),
                      child: Text(
                        speciality,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03, // Texte dynamique
                          fontWeight: FontWeight.bold,
                          fontFamily: "Orbitron",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Détails
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Orbitron",
                          color: const Color(0xFF191A2D),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Clients en attente :",
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontFamily: "Orbitron",
                              color: const Color(0xFF191A2D),
                            ),
                          ),
                          Text(
                            clientsInQueue.toString(),
                            style: TextStyle(
                              fontSize: screenWidth * 0.065,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Orbitron",
                              color: const Color(0xFF191A2D),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenHeight * 0.015,
            right: screenWidth * 0.03,
            child: GestureDetector(
              onTap: onIconTap,
              child: Material(
                elevation: 5,
                shape: const CircleBorder(),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: Icon(
                    Icons.person_add_alt_1,
                    size: screenWidth * 0.09,
                    color: const Color(0xFF191A2D),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
