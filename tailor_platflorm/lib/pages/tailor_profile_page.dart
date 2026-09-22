import 'package:flutter/material.dart';
import 'package:tailor_platflorm/pages/catalogue_page.dart';
import '../data/mock_data.dart';

class TailorProfilePage extends StatelessWidget {
  const TailorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mockTailor.name),
      ),
      body: 
      Padding(
        padding: EdgeInsets.all(16),
        child: 
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(mockTailor.name[0]),
              ),
              SizedBox(
                height: 10,
              ),
              Text(mockTailor.name),
              SizedBox(
                height: 5,
              ),
              Text(mockTailor.description),
              Text(mockTailor.location),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const CataloguePage(),
                    ),
                  );
                },
                child: const Text('Mon catalogue'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: 
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: 
                            Column(
                              children: [
                                Icon(Icons.shopping_bag),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Commandes"),
                                Text("12"),
                              ],
                            ),
                        ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Card(
                      child: 
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: 
                            Column(
                              children: [
                                Icon(Icons.shopping_bag_sharp),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Favoris"),
                                Text("5"),
                              ],
                            ),
                        ),
                    ),
                  ),
                ],
              ),
          ],
      ),
      )
    );
  }
}