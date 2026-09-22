import 'package:flutter/material.dart';
import 'package:tailor_platflorm/data/mock_data.dart';
import 'package:tailor_platflorm/pages/order_confirmation_page.dart';

class CartPage extends StatefulWidget{

  const CartPage({super.key});

  @override
  State<CartPage> createState () => _CartPage();

}

class _CartPage extends State<CartPage> {

  double calculerTotal() {
    double total = 0;

    for (final realisation in cart) {
      total = total + realisation.price;
    }

    return total;
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Panier (${cart.length})'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final realisation = cart[index];

                return Card(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.sell,
                        size: 50,
                      ),
                      Column(
                        children: [
                          Text(realisation.title),
                          Text(realisation.price.toString())
                        ],
                      )
                    ],
                  ),
                );
              }
            )
          ),
          const SizedBox(height: 16,),
          Text('Total : ${calculerTotal()} FCFA'),
          const SizedBox(height: 50,),
          ElevatedButton(
            onPressed: (){
              final total = calculerTotal();

              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => OrderConfirmationPage(total: total)                  
                  
                )
              );
            }, 
            child: Text('Commander')
          )
        ],
      ),
    );
  }

}