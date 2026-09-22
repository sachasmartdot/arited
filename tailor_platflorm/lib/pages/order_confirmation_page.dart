import 'package:flutter/material.dart';
//import 'package:tailor_platflorm/pages/catalogue_page.dart';
import 'package:tailor_platflorm/pages/client_catalogue_page.dart';

class OrderConfirmationPage extends StatelessWidget{

  final double total;

  const OrderConfirmationPage({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commande confirmee'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.safety_check),
            const Text('Commande confirmee'),
            const Text('Votre commande a bien ete enregistree.'),
            Text('Total : $total FCFA'),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ClientCataloguePage())
              ), 
              child: Text('Retour au catalogue')
            )
          ],
        ), 
      ),
    );
  }
}