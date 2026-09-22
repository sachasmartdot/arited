import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class CataloguePage extends StatelessWidget{
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Catalogue'),
      ),
      body: 
        Padding(
          padding: const EdgeInsets.all(16),
          child:
            GridView.builder(
              itemCount: mockRealisations.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
                
              itemBuilder: (context, index) {
                final realisation = mockRealisations[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.checkroom,
                          size: 50,
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          realisation.title,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5,),
                        Text('${realisation.price} FCFA'),
                      ],
                    ),

                  ),
                );
              }
            )
        )
    );
  }
}