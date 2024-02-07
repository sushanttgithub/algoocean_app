import 'package:flutter/material.dart';

import '../model/img_model.dart';

class CartScreen extends StatefulWidget {
   List<dynamic> price;
  List<dynamic> cartImg;

  CartScreen({super.key, required this.price, required this.cartImg,});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartImg.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 10,
                              color: Colors.deepPurple,
                            ),
                          ),
                          child: Image.network(
                            widget.cartImg[index].toString(),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.height * .45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                          child: Center(
                            child: Text(
                              " Price: ${widget.price[index]}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

