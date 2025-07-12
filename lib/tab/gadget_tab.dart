import 'package:flutter/material.dart';
import '../util/gadget_tile.dart';

class gadgetTab extends StatelessWidget {
  List gadgetsOnSale = [
    ["Camera", "599", Colors.blue, "lib/images/download (3).png"],
    ["Camera", "1200", Colors.grey, "lib/images/camera.png"],
    ["Mini-Fan", "199", Colors.green, "lib/images/fan.png"],
    ["Mini-printer", "99", Colors.cyan, "lib/images/printer.png"],
    ["SmartWatch", "499", Colors.red, "lib/images/smartwatch.png"],
    ["Tablet", "350", Colors.orange, "lib/images/tablet.png"],
    ["Headphones", "800", Colors.cyan, "lib/images/headphones.png"],
    ["Keyboard", "60", Colors.yellow, "lib/images/keyboard.png"],
    ["Mouse", "40", Colors.blueAccent, "lib/images/souris.png"],
    ["Charger", "20", Colors.indigo, "lib/images/charger.png"],
    ["Headset", "300", Colors.brown, "lib/images/headset.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: gadgetsOnSale.length,
      padding: EdgeInsets.all(13),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.70,
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
                              gadgetsOnSale[index][3],
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
                                gadgetsOnSale[index][0],
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
                                "Price: ${gadgetsOnSale[index][1]}DT",
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
          child: GadgetTile(
            gadgetName: gadgetsOnSale[index][0],
            gadgetPrice: gadgetsOnSale[index][1],
            gadgetColor: gadgetsOnSale[index][2],
            imageName: gadgetsOnSale[index][3],
          ),
        );
      },
    );
  }
}
