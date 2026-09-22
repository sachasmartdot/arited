import 'package:flutter/material.dart';
import 'package:tailor_platflorm/data/mock_data.dart';
import 'package:tailor_platflorm/pages/article_detail_page.dart';
import 'package:tailor_platflorm/pages/cart_page.dart';

import 'dart:io';

class ClientCataloguePage extends StatefulWidget {
  const ClientCataloguePage({super.key});

  @override
  State<ClientCataloguePage> createState() => _ClientCataloguePage();
}

class _ClientCataloguePage extends State<ClientCataloguePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les modeles'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            ),
            icon: const Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: mockRealisations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (context, index) {
            final realisation = mockRealisations[index];

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    /*const Icon(
                      Icons.shopping_bag_sharp,
                      size: 50,
                    ),*/
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      // pour gerer l'import depuis l'appareil tel aussi : use dart.io
                      child: realisation.image.startsWith('assets/')
                          ? Image.asset(
                              realisation.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(realisation.image),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),

                    Text(realisation.title, textAlign: TextAlign.center),
                    Text(realisation.description, textAlign: TextAlign.center),
                    Text(
                      realisation.price.toString(),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleDetailPage(realisation: realisation),
                          ),
                        );
                      },
                      child: const Text('Voir'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
