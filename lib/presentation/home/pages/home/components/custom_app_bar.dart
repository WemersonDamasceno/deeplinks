import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        child: Row(
          children: [
            Hero(
              tag: 'intro',
              child: Image.asset(
                'assets/images/logo_black.png',
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 60,
                width: size.width * 0.5,
                padding: const EdgeInsets.only(top: 3, left: 10),
                alignment: Alignment.centerLeft,
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            const Icon(Icons.dehaze_rounded)
          ],
        ),
      ),
    );
  }
}
