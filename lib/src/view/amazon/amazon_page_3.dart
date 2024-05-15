import 'package:flutter/material.dart';

class AmazonPage3 extends StatefulWidget {
  const AmazonPage3({super.key});

  @override
  State<AmazonPage3> createState() => _AmazonPage3State();
}

class _AmazonPage3State extends State<AmazonPage3> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Amazon Page 3 - FBA'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height - 100,
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
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  items: taxFBAMap
                      .map((key, value) {
                        return MapEntry(key,
                            DropdownMenuItem(value: value, child: Text(key)));
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
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 221, 240),
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                          'R\$ 100,00',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'R\$ 95,00',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'R\$ 11,00',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'R\$ 5,00',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '3 %',
                          style: TextStyle(fontSize: 20),
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
