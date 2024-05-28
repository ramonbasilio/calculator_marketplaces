import 'package:calculator_marketplaces/src/view/amazon/amazon_page_1_teste.dart';
import 'package:calculator_marketplaces/src/view/amazon/amazon_page_2.dart';
import 'package:calculator_marketplaces/src/view/amazon/amazon_page_3.dart';
import 'package:calculator_marketplaces/src/view/amazon/amazon_page_4.dart';
import 'package:calculator_marketplaces/src/view/amazon/amazon_page_1.dart';
import 'package:flutter/material.dart';

class AmazonPageMain extends StatefulWidget {
  const AmazonPageMain({super.key});

  @override
  State<AmazonPageMain> createState() => _AmazonPageMainState();
}

class _AmazonPageMainState extends State<AmazonPageMain> {
  int indexCurrent = 0;
  final List<Widget> screens = [
    const AmazonPage01Teste(),
    const AmazonPage02(),
    const AmazonPage03(),
    const AmazonPage04(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexCurrent],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.deepPurple.shade100,
        iconSize: 0,
        currentIndex: indexCurrent,
        onTap: (int value) {
          setState(() {
            indexCurrent = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'ENVIO\nPRÓPRIO',
              icon: Icon(
                Icons.abc,
              )),
          BottomNavigationBarItem(
              label: 'DBA < R\$ 79',
              icon: Icon(
                Icons.abc,
              )),
          BottomNavigationBarItem(
              label: 'DBA > R\$ 79',
              icon: Icon(
                Icons.abc,
              )),
          BottomNavigationBarItem(
              label: 'FBA',
              icon: Icon(
                Icons.abc,
              )),
        ],
      ),
    );
  }
}
