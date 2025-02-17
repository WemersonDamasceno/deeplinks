import 'package:deeplinks_app/core/app_colors.dart';
import 'package:deeplinks_app/presentation/home/models/item_shop.dart';
import 'package:deeplinks_app/presentation/product_details/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_rounded_buttom.dart';

class ProductDetails extends StatefulWidget {
  final ItemProduct? product;
  final String productId;

  const ProductDetails({
    super.key,
    required this.product,
    required this.productId,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ItemProduct? _product;

  @override
  void initState() {
    super.initState();

    _product = widget.product;

    //Chamar a API para recuperar o produto pelo ID
    _product ??= ItemProduct(
      id: '456',
      nome: "Player 456",
      pathImage: "assets/images/player_2.png",
      price: 30.0,
      description:
          "O protagonista da história, lutando por uma segunda chance na vida.",
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: size.height * 0.55,
                      width: size.width * 0.5,
                      decoration: const BoxDecoration(
                        color: RoundColor.pinkShade,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Hero(
                      tag: _product!.pathImage,
                      child: Image.asset(
                        _product!.pathImage,
                        height: size.height * 0.55,
                      ),
                    ),
                  ),
                  const AppBarProdutoDetalhes(),
                ],
              ),
              Text(
                _product!.nome,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(
                          "R\$ ",
                          style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff8B8BA1),
                          ),
                        ),
                        Text(
                          _product!.price.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8B8BA1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                    child: Row(
                      children: [
                        RoundedButtom(
                          color: RoundColor.pinkShade,
                          icon: Icons.arrow_downward_rounded,
                          onPress: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: size.width * 0.07,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff8B8BA1),
                            ),
                          ),
                        ),
                        RoundedButtom(
                          color: RoundColor.primary,
                          icon: Icons.arrow_upward_rounded,
                          onPress: () {},
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
