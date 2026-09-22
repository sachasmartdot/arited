import 'package:flutter/material.dart';
import 'package:tailor_platflorm/pages/add_article_page.dart';
import '../data/mock_data.dart';

// pour l'import des images avec File
import 'dart:io';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  // va servir a gerer l'extension de la description des modeles
  //bool _isExpandedModels = false; -> ca rendait le pliage global

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Catalogue'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddArticlePage()),
              );
              setState(() {
                // change state here
              });
            },
            icon: const Icon(Icons.add),
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
            childAspectRatio: 0.7,
          ),

          itemBuilder: (context, index) {
            return RealisationCard(realisation: mockRealisations[index]);
          },
        ),
      ),
    );
  }
}

//TODO: revoir ce morceau de code -> son role est d'individualiser le pliage
class RealisationCard extends StatefulWidget {
  final dynamic realisation;
  const RealisationCard({super.key, required this.realisation});

  @override
  State<RealisationCard> createState() => _RealisationCardState();
}

class _RealisationCardState extends State<RealisationCard> {
  bool _isExpandedDesc = false;
  bool _isExpandedTitle = false; // ca retourne ca en local a la Card

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                _isExpandedTitle = !_isExpandedTitle;
              }),
              child: Text(
                widget.realisation.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: _isExpandedTitle ? null : 1,
                overflow: _isExpandedTitle
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 4),
            Expanded(
              // Un seul Expanded pour l'image
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // pour gerer l'import depuis l'appareil tel aussi : use dart.io
                child: widget.realisation.image.startsWith('assets/')
                    ? Image.asset(
                        widget.realisation.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(widget.realisation.image),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => setState(() => _isExpandedDesc = !_isExpandedDesc),
              child: Text(
                widget.realisation.description,
                style: TextStyle(color: Colors.grey[700], fontSize: 10),
                maxLines: _isExpandedDesc ? null : 2,
                overflow: _isExpandedDesc
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${widget.realisation.price} FCFA',
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
