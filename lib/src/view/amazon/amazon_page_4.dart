import 'package:calculator_marketplaces/src/calculus/amazon_calc.dart';
import 'package:flutter/material.dart';

class AmazonPage04 extends StatefulWidget {
  const AmazonPage04({super.key});

  @override
  State<AmazonPage04> createState() => _AmazonPage04State();
}

class _AmazonPage04State extends State<AmazonPage04> {
  final TextEditingController _costProduct = TextEditingController();
  final TextEditingController _margemProduct = TextEditingController();
  int selectedRadio = 1;
  double tax = 0.0;
  static const Map<String, double> taxFBAMap = {
    '0g    ~  100g  -> R\$ 14,05': 14.05,
    '100g  ~  200g  -> R\$ 14,55': 14.55,
    '200g  ~  300g  -> R\$ 15,05': 15.05,
    '400g  ~  500g  -> R\$ 16,25': 16.25,
    '500g  ~  750g  -> R\$ 16,85': 16.85,
    '750g  ~  1,0kg -> R\$ 17,85': 17.45,
    '1,5kg ~  1,5kg -> R\$ 18,85': 18.45,
  };
  double? taxFBA = 14.05;
  double productValue = 0.0;
  double incomeValue = 0.0;
  double gainValue = 0.0;
  double taxTotal = 0.0;
  double taxPercent = 0.0;

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
                        ),
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
              SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          const Text(
                            'Taxa FBA',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButton(
                              items: taxFBAMap
                                  .map((key, value) {
                                    return MapEntry(
                                      key,
                                      DropdownMenuItem(
                                        value: value,
                                        child: Center(
                                          child: Text(key),
                                        ),
                                      ),
                                    );
                                  })
                                  .values
                                  .toList(),
                              value: taxFBA,
                              onChanged: (double? value) {
                                if (value != null) {
                                  setState(() {
                                    taxFBA = value;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
                                  taxFBA!,
                                  double.parse(_margemProduct.text),
                                  double.parse(_costProduct.text
                                      .replaceAll(RegExp(r','), '.')));

                              gainValue = AmazonCalc.gainValue(
                                  productValue,
                                  taxFBA!,
                                  double.parse(_costProduct.text
                                      .replaceAll(RegExp(r','), '.')),
                                  'DBA>79ouFBA');

                              incomeValue =
                                  AmazonCalc.incomeValue(productValue, taxFBA!);

                              taxTotal = AmazonCalc.taxTotal(
                                  productValue, incomeValue);

                              taxPercent =
                                  AmazonCalc.taxPercent(productValue, taxTotal);
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
              )
            ],
          ), //INICIO
        ),
      ),
    );
  }
}
