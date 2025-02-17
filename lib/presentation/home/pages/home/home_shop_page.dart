import 'package:deeplinks_app/data/repositories/itens_shop_repositorie.dart';
import 'package:deeplinks_app/presentation/product_details/product_details_page.dart';
import 'package:flutter/material.dart';

import 'components/custom_app_bar.dart';
import 'components/custom_card_item.dart';
import 'components/custom_title_cards.dart';

class HomeShopPage extends StatelessWidget {
  const HomeShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final listSoldados = ItemShopRepository().itemsListSoldados;
    final listPlayers = ItemShopRepository().itemsListPlayers;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.05,
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleCards(
                          text: "Recommended for you",
                        ),
                        SizedBox(
                          height: size.height * 0.5,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listSoldados.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomCardItem(
                                  pathImg: listSoldados[index].pathImage,
                                  nameItem: listSoldados[index].nome,
                                  onPress: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(seconds: 1),
                                        pageBuilder: (_, __, ___) =>
                                            ProductDetails(
                                          product: listSoldados[index],
                                          productId: listSoldados[index].id,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: TitleCards(
                            text: "Game Players",
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.5,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listPlayers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCardItem(
                                pathImg: listPlayers[index].pathImage,
                                nameItem: listPlayers[index].nome,
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          ProductDetails(
                                        productId: listPlayers[index].id,
                                        product: listPlayers[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
