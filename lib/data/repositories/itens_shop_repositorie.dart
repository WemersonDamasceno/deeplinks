import 'package:deeplinks_app/presentation/home/models/item_shop.dart';

class ItemShopRepository {
  final List<ItemProduct> itemsListSoldados = [
    ItemProduct(
      id: '123',
      nome: "Front man toy",
      pathImage: "assets/images/black_face.png",
      price: 30.0,
      description:
          "O líder misterioso e enigmático. Um item essencial para os fãs da série.",
    ),
    ItemProduct(
      id: '430',
      nome: "Supervisor toy",
      pathImage: "assets/images/soldado_1.png",
      price: 15.0,
      description:
          "O supervisor de máscara quadrada, responsável por coordenar os soldados.",
    ),
    ItemProduct(
      id: '789',
      nome: "Supervisor toy",
      pathImage: "assets/images/soldado_3.png",
      price: 12.0,
      description:
          "Supervisor de máscara triangular, encarregado de manter a ordem nos jogos.",
    ),
    ItemProduct(
      id: '321',
      nome: "Supervisor toy",
      pathImage: "assets/images/soldado_2.png",
      price: 7.0,
      description:
          "O soldado de máscara redonda, executando ordens superiores sem questionar.",
    ),
  ];

  final List<ItemProduct> itemsListPlayers = [
    ItemProduct(
      id: '001',
      nome: "Player 001",
      pathImage: "assets/images/player_1.png",
      price: 20.0,
      description:
          "O jogador mais velho e misterioso do jogo. Um personagem icônico da trama.",
    ),
    ItemProduct(
      id: '456',
      nome: "Player 456",
      pathImage: "assets/images/player_2.png",
      price: 30.0,
      description:
          "O protagonista da história, lutando por uma segunda chance na vida.",
    ),
    ItemProduct(
      id: '067',
      nome: "Player 067",
      pathImage: "assets/images/player_067.png",
      price: 10.0,
      description:
          "A jogadora destemida que fará de tudo para vencer e ajudar sua família.",
    ),
    ItemProduct(
      id: '218',
      nome: "Player 218",
      pathImage: "assets/images/player_218.png",
      price: 15.0,
      description:
          "Um ex-colega de infância do protagonista, lutando para sair das dívidas.",
    ),
    ItemProduct(
      id: '199',
      nome: "Player 199",
      pathImage: "assets/images/player_199.png",
      price: 15.0,
      description:
          "O jogador de bom coração que se envolve no jogo para ajudar sua família.",
    ),
  ];
}
