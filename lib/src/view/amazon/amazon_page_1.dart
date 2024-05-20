import 'package:calculator_marketplaces/src/calculus/amazon_calc.dart';
import 'package:calculator_marketplaces/src/shared_preferences/amazon-SP.dart';
import 'package:flutter/material.dart';

class AmazonPage1 extends StatefulWidget {
  const AmazonPage1({super.key});

  @override
  State<AmazonPage1> createState() => _AmazonPageState();
}

class _AmazonPageState extends State<AmazonPage1> {
  final TextEditingController _costProduct = TextEditingController();
  final TextEditingController _margemProduct = TextEditingController();
  final SharedPreference _sharedPreferenceInstance = SharedPreference();

  double productValue = 0.0;
  double incomeValue = 0.0;
  double gainValue = 0.0;
  double taxTotal = 0.0;
  double taxPercent = 0.0;
  double costProduct = 0.0;
  int margemProduct = 0;

  void fetchData() async {
    await _sharedPreferenceInstance
        .readDouble(key: 'productValue')
        .then((double? value) {
      setState(() {
        productValue = value!;
      });
    });
    await _sharedPreferenceInstance
        .readDouble(key: 'incomeValue')
        .then((double? value) {
      setState(() {
        incomeValue = value!;
      });
    });

    await _sharedPreferenceInstance
        .readDouble(key: 'gainValue')
        .then((double? value) {
      setState(() {
        gainValue = value!;
      });
    });

    await _sharedPreferenceInstance
        .readDouble(key: 'taxTotal')
        .then((double? value) {
      setState(() {
        taxTotal = value!;
      });
    });

    await _sharedPreferenceInstance
        .readDouble(key: 'taxPercent')
        .then((double? value) {
      setState(() {
        taxPercent = value!;
      });
    });

    await _sharedPreferenceInstance
        .readDouble(key: 'costProduct')
        .then((double? value) {
      setState(() {
        _costProduct.text = value!.toString();
      });
    });

    await _sharedPreferenceInstance
        .readInt(key: 'margemProduct')
        .then((int? value) {
      setState(() {
        _margemProduct.text = value!.toString();
      });
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Amazon Page 1 - DBA < 79'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              kToolbarHeight -
              kBottomNavigationBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //INICIO
            children: [
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    productValue > 79
                        ? const Text('Valor de anúncio maior que 79')
                        : const SizedBox.shrink(),
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
                                    //_costProduct.text = '0';
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
                                onFieldSubmitted: (value) {
                                  SharedPreference().saveData(
                                      type: 'Int',
                                      key: 'margem',
                                      value: int.parse(_margemProduct.text));
                                },
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
                                    //_margemProduct.text = '0';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_costProduct.text.isNotEmpty &&
                                _margemProduct.text.isNotEmpty) {
                              setState(() {
                                productValue = AmazonCalc.productValue(
                                    5.5,
                                    double.parse(_margemProduct.text),
                                    double.parse(_costProduct.text
                                        .replaceAll(RegExp(r','), '.')));

                                gainValue = AmazonCalc.gainValue(
                                    productValue,
                                    double.parse(_margemProduct.text),
                                    double.parse(_costProduct.text
                                        .replaceAll(RegExp(r','), '.')));

                                incomeValue =
                                    AmazonCalc.incomeValue(productValue, 5.5);

                                taxTotal = AmazonCalc.taxTotal(
                                    productValue, incomeValue);

                                taxPercent = AmazonCalc.taxPercent(
                                    productValue, taxTotal);
                              });
                              _sharedPreferenceInstance.saveData(
                                  type: 'Double',
                                  key: 'costProduct',
                                  value: double.parse(_costProduct.text));
                              _sharedPreferenceInstance.saveData(
                                  type: 'Int',
                                  key: 'margemProduct',
                                  value: int.parse(_margemProduct.text));
                              _sharedPreferenceInstance.saveData(
                                  type: 'Double',
                                  key: 'productValue',
                                  value: productValue);
                              _sharedPreferenceInstance.saveData(
                                  type: 'Double',
                                  key: 'gainValue',
                                  value: gainValue);
                              _sharedPreferenceInstance.saveData(
                                  type: 'Double',
                                  key: 'incomeValue',
                                  value: incomeValue);
                              _sharedPreferenceInstance.saveData(
                                  type: 'Double',
                                  key: 'taxTotal',
                                  value: taxTotal);
                              _sharedPreferenceInstance.saveData(
                                  type: 'Double',
                                  key: 'taxPercent',
                                  value: taxPercent);
                            }
                          },
                          child: const Text(
                            'Calcular',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    // productValue > 79
                    //     ? const Text(
                    //         'Valor de anúncio maior que 79.\n Utilize a próxima calculadora')
                    //     : const SizedBox.shrink(),
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
                    SizedBox(
                      width: 100,
                      child: Column(
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
