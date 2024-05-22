import 'package:calculator_marketplaces/src/calculus/amazon_calc.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class AmazonPage03 extends StatefulWidget {
  const AmazonPage03({super.key});

  @override
  State<AmazonPage03> createState() => _AmazonPage03State();
}

class _AmazonPage03State extends State<AmazonPage03> {
  final TextEditingController _costProduct = TextEditingController();
  final TextEditingController _margemProduct = TextEditingController();
  int selectedRadio = 0;
  double tax = 20.45;
  double productValue = 0.0;
  double incomeValue = 0.0;
  double gainValue = 0.0;
  double taxTotal = 0.0;
  double taxPercent = 0.0;
  bool alertProductValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/amazon_logo.png',
            width: 120,
          ),
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
                alertProductValue
                    ? const Text(
                        'ANUNCIO MENOR QUE 79',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    : const SizedBox.shrink(),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Taxa DBA',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GFRadioListTile(
                        padding: EdgeInsets.zero,
                        radioColor: Colors.deepPurple,
                        size: 20,
                        title: const Text('Peso: 500g ~ 1kg   Taxa: R\$ 20,45'),
                        value: 0,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value;
                            tax = 20.45;
                          });
                        },
                      ),
                      GFRadioListTile(
                        padding: EdgeInsets.zero,
                        radioColor: Colors.deepPurple,
                        size: 20,
                        title:
                            const Text('Peso: 1kg ~ 2kg      Taxa: R\$ 21,45'),
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value;
                            tax = 21.45;
                          });
                        },
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
                                    tax,
                                    double.parse(_costProduct.text
                                        .replaceAll(RegExp(r','), '.')),
                                    'DBA>79ouFBA');

                                incomeValue =
                                    AmazonCalc.incomeValue(productValue, tax);

                                taxTotal = AmazonCalc.taxTotal(
                                    productValue, incomeValue);

                                taxPercent = AmazonCalc.taxPercent(
                                    productValue, taxTotal);
                              });
                              if (productValue < 79) {
                                setState(() {
                                  alertProductValue = true;
                                });
                              } else {
                                setState(() {
                                  alertProductValue = false;
                                });
                              }
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Anúncio',
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  alertProductValue ? Colors.red : Colors.black,
                              fontWeight: alertProductValue
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          const Text(
                            'Receita',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            'Lucro',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            'Taxas R\$',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
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
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  alertProductValue ? Colors.red : Colors.black,
                              fontWeight: alertProductValue
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
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
