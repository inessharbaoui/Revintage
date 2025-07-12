import 'package:flutter/material.dart';
import '../util/clothes_tile.dart';

class clothesTab extends StatelessWidget {
  List clothesOnSale = [
    ["T-Shirt", "25", Colors.blue, "lib/images/out1.png"],
    ["Skirt", "50", Colors.blueGrey, "lib/images/out2.png"],
    ["Sweater", "120", Colors.brown, "lib/images/out3.png"],
    ["T-Shirt", "70", Colors.red, "lib/images/out4.png"],
    ["Outfit", "40", Colors.green, "lib/images/out5.png"],
    ["Shirt", "28", Colors.grey, "lib/images/out13.png"],
    ["Suit", "200", Colors.pink, "lib/images/out14.png"],
    ["Shirt", "30", Colors.yellow, "lib/images/out6.png"],
    ["Blouse", "45", Colors.pink, "lib/images/out7.png"],
    ["Skirt", "35", Colors.orange, "lib/images/out8.png"],
    ["Hoodie", "55", Colors.orange, "lib/images/out9.png"],
    ["Shirt", "28", Colors.grey, "lib/images/out10.png"],
    ["Suit", "200", Colors.pink, "lib/images/out11.png"],
    ["shirt", "200", Colors.pink, "lib/images/out12.png"],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: clothesOnSale.length,
      padding: EdgeInsets.all(13),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.7,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  content: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              clothesOnSale[index][3],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 10,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                clothesOnSale[index][0],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Phone: +216 93 218 505",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Price: ${clothesOnSale[index][1]}DT",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Close', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                );
              },
            );
          },
          child: ClothingTile(
            clothingName: clothesOnSale[index][0],
            clothingPrice: clothesOnSale[index][1],
            clothingColor: clothesOnSale[index][2],
            imageName: clothesOnSale[index][3],
          ),
        );
      },
    );
  }
}
