import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AmazonPage2 extends StatefulWidget {
  const AmazonPage2({super.key});

  @override
  State<AmazonPage2> createState() => _AmazonPage2State();
}

class _AmazonPage2State extends State<AmazonPage2> {
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
        title: const Text('Amazon Page 2 - DBA > 79'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
        return SingleChildScrollView(
          physics: isKeyboardVisible
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Container(
            color: Colors.blueGrey,
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height - 112,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //INICIO
              children: [
                SizedBox(
                  height: 110,
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
                                height: 50,
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
                                height: 50,
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
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Taxa DBA'),
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
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                productValue > 79
                    ? const Text(
                        'Valor de anúncio maior que 79. Utilize a próxima calcuadora')
                    : const SizedBox.shrink(),
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
        );
      }),
    );
  }
}
