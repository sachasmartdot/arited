import 'package:flutter/material.dart';
import 'package:tailor_platflorm/data/mock_data.dart';
import 'package:tailor_platflorm/models/realisation.dart';

import 'dart:io';

class ArticleDetailPage extends StatelessWidget {
  final Realisation realisation;

  const ArticleDetailPage({super.key, required this.realisation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail du modele ${realisation.title} ')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*const Icon(
              Icons.shopping_bag,
              size: 200,
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

            Text(realisation.title),
            Text(realisation.description),
            Text(realisation.price.toString()),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                cart.add(realisation);
                Navigator.pop(context);
              },
              child: const Text('Ajouter au panier'),
            ),
          ],
        ),
      ),
    );
  }
}
