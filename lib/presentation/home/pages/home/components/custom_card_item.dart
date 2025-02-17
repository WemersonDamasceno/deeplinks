import 'package:flutter/material.dart';

class CustomCardItem extends StatelessWidget {
  final String pathImg;
  final String nameItem;
  final Function() onPress;
  const CustomCardItem({
    super.key,
    required this.pathImg,
    required this.nameItem,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, right: 4.0),
            child: SizedBox(
              height: size.height * 0.38,
              width: size.width * 0.42,
              child: Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Squid Game",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            nameItem,
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image.asset(
                            "assets/images/star.png",
                            height: size.height * 0.05,
                            width: size.width * 0.05,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 12,
                        left: 8,
                        right: 8,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: TextButton(
                          onPressed: onPress,
                          child: const Text(
                            "View details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Hero(
              tag: pathImg,
              child: Image.asset(
                pathImg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
