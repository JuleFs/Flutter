import 'package:flutter/material.dart';
import '../ui/details_container.dart';
import 'listview.dart';
import 'pdf_preview.dart';

class DetailsPage extends StatelessWidget {
  final Character character;

  const DetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${character.name} Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Icon(Icons.error, color: Colors.red, size: 50),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PdfPreviewPage(character: character),
                    ),
                  );
                },
                icon: const Icon(Icons.print),
                label: const Text('Generar PDF / Impresión'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),

            const Divider(),

            DetailsContainer(title: 'Nombre', value: character.name),
            DetailsContainer(title: 'Estado', value: character.status),
            DetailsContainer(title: 'Especie', value: character.species),
            DetailsContainer(
              title: 'Tipo',
              value: character.type.isEmpty ? 'N/A' : character.type,
            ),
            DetailsContainer(title: 'Género', value: character.gender),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
