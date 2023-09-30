import 'package:flutter/material.dart';
import 'package:submission_flutter_beginner/detail_shop_screen.dart';

import 'shop_screen.dart';

class ItemShopList extends StatelessWidget {
  final Shop shop;

  const ItemShopList({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailShopScreen(
                          shop: shop,
                        );
                      },
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  child: Image.asset(
                    shop.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Text(
            shop.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Price : ${shop.price}K",
            style: const TextStyle(color: Color.fromRGBO(12, 28, 16, 1)),
          )
        ],
      ),
    );
  }
}
