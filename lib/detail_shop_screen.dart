import 'package:flutter/material.dart';
import 'package:submission_flutter_beginner/shop_screen.dart';
import 'package:toast/toast.dart';

class DetailShopScreen extends StatelessWidget {
  final Shop shop;

  const DetailShopScreen({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Toast.show("More Button",
                  duration: Toast.lengthShort, gravity: Toast.bottom);
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Image.asset(shop.image),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Toast.show("Selectable Button",
                        duration: Toast.lengthShort, gravity: Toast.bottom);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromRGBO(93, 169, 106, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Body Only'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Toast.show("Selectable Button",
                        duration: Toast.lengthShort, gravity: Toast.bottom);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromRGBO(93, 169, 106, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Body + Lens'),
                ),
              ],
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      shop.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                    Text(
                      "Price : ${shop.price}K",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Row(
                children: [
                  Text(
                    "Total item : ",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  AddItem(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Row(
                children: [Text("Package Protection : "), SwitchButton()],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Row(
                children: [
                  Text("Add Memory Card"),
                  CheckBox(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16),
              child: const Row(
                children: [
                  Text("Add Bag + Battery"),
                  CheckBox(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: const Text(
                "Description : ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16),
              child: Text(shop.desc),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Toast.show("Buy Button",
                        duration: Toast.lengthShort, gravity: Toast.bottom);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(93, 169, 106, 1),
                    ),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Toast.show("FAQ Button",
              duration: Toast.lengthShort, gravity: Toast.bottom);
        },
        backgroundColor: const Color.fromRGBO(93, 169, 106, 1),
        child: const Icon(Icons.call_rounded, color: Colors.white),
      ),
    );
  }
}

//terapan stateful widget
class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(
          () {
            isSwitched = value;
            print(isSwitched);
          },
        );
      },
      activeTrackColor: const Color.fromRGBO(52, 88, 94, 1),
      inactiveTrackColor: const Color.fromRGBO(93, 169, 106, 0.5),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
      activeColor: const Color.fromRGBO(52, 88, 94, 1),
    );
  }
}

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreasedCounter() {
    setState(() {
      _counter-- >= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: _incrementCounter, icon: const Icon(Icons.add)),
        Text(
          '$_counter',
        ),
        IconButton(
            onPressed: _decreasedCounter, icon: const Icon(Icons.remove)),
      ],
    );
  }
}
