import 'package:calculator_marketplaces/src/calculus/amazon_calc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AmazonPage03 extends StatefulWidget {
  const AmazonPage03({super.key});

  @override
  State<AmazonPage03> createState() => _AmazonPage03State();
}

class _AmazonPage03State extends State<AmazonPage03> {
  final TextEditingController _costProduct = TextEditingController();
  final TextEditingController _margemProduct = TextEditingController();
  int selectedRadio = 1;
  double tax = 20.45;
  double productValue = 0.0;
  double incomeValue = 0.0;
  double gainValue = 0.0;
  double taxTotal = 0.0;
  double taxPercent = 0.0;
  final double bottomNavBarHeight = kBottomNavigationBarHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('DBA Maior que R\$ 79'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight -
                kBottomNavigationBarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //INICIO
              children: [
                SizedBox(
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Custo Produto'),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80,
                                child: TextFormField(
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  controller: _costProduct,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.deepPurple.shade100,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _costProduct.clear();
                                    });
                                  },
                                  icon: const Icon(Icons.clear))
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Margem Produto'),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80,
                                child: TextFormField(
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  controller: _margemProduct,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.deepPurple.shade100,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _margemProduct.clear();
                                    });
                                  },
                                  icon: const Icon(Icons.clear))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Taxa DBA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        minVerticalPadding: 0,
                        contentPadding: const EdgeInsets.all(0),
                        minLeadingWidth: 0,
                        title: const Text('500g ~ 1kg R\$ 20,45'),
                        leading: Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value!;
                                tax = 20.45;
                              });
                            }),
                      ),
                      ListTile(
                        minVerticalPadding: 0,
                        contentPadding: const EdgeInsets.all(0),
                        minLeadingWidth: 0,
                        title: const Text('1kg ~ 2kg R\$ 21,45'),
                        leading: Radio(
                            value: 2,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value!;
                                tax = 21.45;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              productValue = 0.0;
                              incomeValue = 0.0;
                              gainValue = 0.0;
                              taxTotal = 0.0;
                              taxPercent = 0.0;

                              _costProduct.clear();
                              _margemProduct.clear();
                            });
                          },
                          child: const Text(
                            'Limpar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_costProduct.text.isNotEmpty &&
                                _margemProduct.text.isNotEmpty) {
                              setState(() {
                                productValue = AmazonCalc.productValue(
                                  tax,
                                  double.parse(_margemProduct.text),
                                  double.parse(
                                    _costProduct.text
                                        .replaceAll(RegExp(r','), '.'),
                                  ),
                                );

                                gainValue = AmazonCalc.gainValue(
                                    productValue,
                                    double.parse(_margemProduct.text),
                                    double.parse(
                                      _costProduct.text
                                          .replaceAll(RegExp(r','), '.'),
                                    ),
                                    false);

                                incomeValue =
                                    AmazonCalc.incomeValue(productValue, tax);

                                taxTotal = AmazonCalc.taxTotal(
                                    productValue, incomeValue);

                                taxPercent = AmazonCalc.taxPercent(
                                    productValue, taxTotal);
                              });
                            }
                          },
                          child: const Text(
                            'Calcular',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 221, 240),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Anúncio',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Receita',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Lucro',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Taxas R\$',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Taxas %',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'R\$ $productValue',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'R\$ $incomeValue',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'R\$ $gainValue',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'R\$ $taxTotal',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            '$taxPercent %',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ), //INICIO
          ),
        ));
  }
}
