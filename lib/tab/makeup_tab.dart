import 'package:flutter/material.dart';

import '../util/makeup_tile.dart';

class makeupTab extends StatelessWidget {
  List makeupOnSale = [
    ["KIKO", "25", Colors.pink, "lib/images/Makeup.png"],
    ["Lipstick", "15", Colors.grey, "lib/images/lipstick.png"],
    ["LIP BALM", "18", Colors.orange, "lib/images/balm.png"],
    ["Cleanser", "20", Colors.blue, "lib/images/foam.png"],
    ["Skin Mask", "22", Colors.purple, "lib/images/skincare.png"],
    ["Pimple Patch", "30", Colors.pink, "lib/images/pimple.png"],
    ["Rhode", "28", Colors.blue, "lib/images/rhode.png"],
    ["Skin Vitamins", "17", Colors.purple, "lib/images/jelly.png"],
    ["Mascara", "25", Colors.grey, "lib/images/mascara.png"],
    ["Gisou", "12", Colors.blue, "lib/images/gisou.png"],
    ["Primer", "14", Colors.pinkAccent, "lib/images/primer.png"],

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: makeupOnSale.length,
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
                              makeupOnSale[index][3],
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
                                makeupOnSale[index][0],
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
                                "Price: ${makeupOnSale[index][1]}DT",
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
          child: MakeupTile(
            makeupName: makeupOnSale[index][0],
            makeupPrice: makeupOnSale[index][1],
            makeupColor: makeupOnSale[index][2],
            imageName: makeupOnSale[index][3],
          ),
        );
      },
    );
  }
}
