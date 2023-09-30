import 'package:flutter/material.dart';
import 'package:submission_flutter_beginner/item_shop_list.dart';
import 'package:toast/toast.dart';

class Shop {
  final String image;
  final String title;
  final double price;
  final String desc;

  Shop(this.image, this.title, this.price, this.desc);
}

List<Shop> shops = [
  Shop("assets/images/eos250.jpg", "Canon EOS 250D", 230.000,
      "Canon EOS 250D: This is a DSLR camera from Canon’s EOS series. It features a 24.1 megapixel sensor and has the ability to shoot 4K movies. It also includes a Dual Pixel CMOS AF system for superb autofocus when using Live View"),
  Shop(
      "assets/images/a6700.jpg",
      "Sony A6700",
      440.000,
      ""
          "The Sony A6700 is an ultra-compact digital SLR that features a 24MP APS-C-sized CMOS sensor, DIGIC 8 processor, and Dual Pixel autofocus system"),
  Shop(
      "assets/images/gfx100s.jpg",
      "Fujifilm GFX 100s",
      123.000,
      ""
          "This camera from Fujifilm’s GFX series is a mirrorless camera with a large, APS-C-size CMOS image sensor with approximately 102 million pixels. It provides a top sensitivity of ISO 25600"),
  Shop("assets/images/lumix.jpg", "Lumix S23", 544.000,
      "Pro for Cinematographer"),
  Shop("assets/images/a7r5.jpg", "Sony A7RIV", 432.000,
      "The Sony A7RIV is a high-resolution full-frame mirrorless camera from Sony’s Alpha series. It features a BSI-CMOS sensor that outputs 60.2MP images"),
  Shop("assets/images/grii.jpg", "Ricoh GRII", 884.000,
      "The Ricoh GRII is a compact digital camera that features a large, APS-C-size CMOS image sensor with approximately 16.2 effective megapixels"),
  Shop("assets/images/blackmagic.jpg", "Black Magic Pro", 456.000,
      "Proffesional Camera"),
  Shop("assets/images/xpro3.jpg", "Fujifilm X-Pro 3", 55.000,
      "The Fujifilm X-Pro3 is a unique mirrorless camera with a hybrid viewfinder and LCD that is only viewable when flipped down. It uses an APS-C X-Trans CMOS 4 sensor with primary color filter"),
  Shop("assets/images/r3.jpg", "Canon EOS R3", 11.000,
      "The Canon EOS R3 is a high-end full-frame mirrorless camera designed for sports, wildlife, and photojournalism. It uses a 24MP Stacked CMOS sensor and a Digic X processor")
];

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(93, 169, 106, 1),
        title: const Text(
          "Sayyid Shop",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Toast.show("Search Button",
                  duration: Toast.lengthShort, gravity: Toast.bottom);
            },
            icon: const Icon(Icons.search, color: Colors.white,),
          ),
          IconButton(
            onPressed: () {
              Toast.show("Cart Button",
                  duration: Toast.lengthShort, gravity: Toast.bottom);
            },
            icon: const Icon(Icons.shopping_bag_outlined,color: Colors.white),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          debugPrint("width : ${constraints.maxWidth}");
          if (constraints.maxWidth <= 620) {
            return ListView.builder(
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final data = shops[index];
                return ItemShopList(shop: data);
              },
            );
          } else if (constraints.maxWidth <= 905) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 30.0),
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final data = shops[index];
                return ItemShopList(shop: data);
              },
            );
          } else if (constraints.maxWidth <= 900) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 30.0),
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final data = shops[index];
                return ItemShopList(shop: data);
              },
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final data = shops[index];
                return ItemShopList(shop: data);
              },
            );
          }
        },
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        elevation: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.navigation_sharp,
                color: Colors.black,
              ),
              label: 'Discover'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              label: 'Account'),
        ],
      ),
       */
    );
  }
}
