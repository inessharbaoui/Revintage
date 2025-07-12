import 'package:flutter/material.dart';
import '../util/furniture_tile.dart';

class furnitureTab extends StatelessWidget {
  final List furnitureOnSale = [
    ["Mirror", "299", Colors.blue, "lib/images/mirror.png"],
    ["Sofa", "150", Colors.brown, "lib/images/sofa.png"],
    ["Living room", "45", Colors.red, "lib/images/sofa1.png"],
    ["Bookshelf", "120", Colors.green, "lib/images/table.png"],
    ["Bookshelf", "99", Colors.yellow, "lib/images/desk.png"],
    ["Shelf", "39", Colors.orange, "lib/images/shelf.png"],
    ["Pots", "200", Colors.grey, "lib/images/flowers.png"],
    ["Table", "250", Colors.purple, "lib/images/table11.png"],
    ["Table", "500", Colors.pink, "lib/images/table111.png"],
    ["Bed", "70", Colors.grey, "lib/images/bed.png"],
    ["TV stand", "80", Colors.pink, "lib/images/tv.png"],
    ["TV stand", "350", Colors.teal, "lib/images/pc.png"],
    ["Organizer", "25", Colors.blueAccent, "lib/images/shower.png"],
    ["Organizer", "180", Colors.cyan, "lib/images/shower (2).png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: furnitureOnSale.length,
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
                              furnitureOnSale[index][3],
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
                                furnitureOnSale[index][0],
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
                                "Price: ${furnitureOnSale[index][1]}DT",
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
          child: FurnitureTile(
            furnitureName: furnitureOnSale[index][0],
            furniturePrice: furnitureOnSale[index][1],
            furnitureColor: furnitureOnSale[index][2],
            imageName: furnitureOnSale[index][3],
          ),
        );
      },
    );
  }
}
