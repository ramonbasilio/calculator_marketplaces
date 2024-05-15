import 'package:flutter/material.dart';

class AmazonPage4 extends StatefulWidget {
  const AmazonPage4({super.key});

  @override
  State<AmazonPage4> createState() => _AmazonPage4State();
}

class _AmazonPage4State extends State<AmazonPage4> {
    final TextEditingController _costProduct = TextEditingController();
  final TextEditingController _margemProduct = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Amazon Page 4 - Envio Próprio'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
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
    );
  }
}
