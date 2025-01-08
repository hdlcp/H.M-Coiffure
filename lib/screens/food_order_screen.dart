import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodOrderScreen extends StatefulWidget {
  const FoodOrderScreen({Key? key}) : super(key: key);

  @override
  _FoodOrderScreenState createState() => _FoodOrderScreenState();
}

class _FoodOrderScreenState extends State<FoodOrderScreen> {
  final List<Map<String, dynamic>> foodItems = [
    {"name": "Pizza", "price": 2000, "image": "assets/images/food_0.png"},
    {"name": "Chawarma", "price": 2000, "image": "assets/images/food_1.png"},
    {"name": "Tacos", "price": 2000, "image": "assets/images/food_0.png"},
    {"name": "Kebab", "price": 2000, "image": "assets/images/food_1.png"},
    {"name": "Sushi", "price": 2000, "image": "assets/images/food_0.png"},
    {
      "name": "Riz au curry",
      "price": 2000,
      "image": "assets/images/food_1.png"
    },
    {"name": "Poulet rôti", "price": 2000, "image": "assets/images/food_0.png"},
    {
      "name": "Nuggets de poulet",
      "price": 2000,
      "image": "assets/images/food_1.png"
    },
  ];

  final Map<int, int> quantities = {};
  final Map<int, bool> isSelected = {};

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return _buildFoodItem(
                  index: index,
                  name: item['name'],
                  price: item['price'],
                  image: item['image'],
                  screenWidth: screenWidth,
                );
              },
            ),
          ),
          _buildBottomBar(screenWidth: screenWidth),
        ],
      ),
    );
  }

  Widget _buildFoodItem({
    required int index,
    required String name,
    required int price,
    required String image,
    required double screenWidth,
  }) {
    final double imageWidth = screenWidth * 0.22;
    final double selectorWidth = screenWidth * 0.35;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF9295B3),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image de l'aliment
            ClipRRect(
              child: Image.asset(
                image,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Détails du plat
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: "Orbitron",
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF191A2D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$price FCFA',
                    style: TextStyle(
                      fontFamily: "Permanent Marker",
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Sélecteur de quantité
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[index] = !(isSelected[index] ?? false);
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/select_icon.svg',
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    color:
                        isSelected[index] == true ? Colors.green : Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: selectorWidth,
                  height: screenWidth * 0.08,
                  decoration: BoxDecoration(
                    color: const Color(0xFF191A2D),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.remove,
                            size: 16, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            if ((quantities[index] ?? 1) > 1) {
                              quantities[index] = (quantities[index] ?? 1) - 1;
                            }
                          });
                        },
                      ),
                      Container(
                        width: screenWidth * 0.08,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          '${quantities[index] ?? 1}',
                          style: TextStyle(
                            fontFamily: "Orbitron",
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF191A2D),
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.add,
                            size: 16, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            quantities[index] = (quantities[index] ?? 1) + 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar({required double screenWidth}) {
    return Container(
      width: double.infinity,
      height: screenWidth * 0.2,
      decoration: const BoxDecoration(
        color: Color(0xFF9295B3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // Action pour "Commander"
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF191A2D),
            minimumSize: Size(screenWidth * 0.8, screenWidth * 0.15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            "Commander",
            style: TextStyle(
              fontFamily: "Orbitron",
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
