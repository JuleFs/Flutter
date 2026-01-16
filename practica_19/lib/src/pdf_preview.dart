import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image_downloader/image_downloader.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'listview.dart';

class PdfPreviewPage extends StatelessWidget {
  final Character character;

  const PdfPreviewPage({super.key, required this.character});

  Future<Uint8List> downloadAndConvertImage(String url) async {
    try {
      // Descarga la imagen en el directorio de imágenes
      final imageId = await ImageDownloader.downloadImage(
        url,
        destination: AndroidDestinationType.directoryPictures,
      );

      if (imageId == null) throw Exception('No se pudo descargar la imagen.');

      final path = await ImageDownloader.findPath(imageId);
      if (path == null) throw Exception('No se encontró la ruta.');

      return File(path).readAsBytes();
    } catch (e) {
      debugPrint('Error al descargar y convertir la imagen: $e');
      return Uint8List(0);
    }
  }

  Future<Uint8List> generatePdf(
    PdfPageFormat format,
    Character character,
  ) async {
    final pdf = pw.Document();

    final imageBytes = await downloadAndConvertImage(character.image);
    pw.ImageProvider? characterImage;

    if (imageBytes.isNotEmpty) {
      characterImage = pw.MemoryImage(imageBytes);
    }

    // Carga del GIF del logo
    final logoImage = await rootBundle.load('assets/progress.gif');
    final logoPdfImage = pw.MemoryImage(logoImage.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Encabezado del documento
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Reporte de Personaje',
                    style: pw.TextStyle(
                      fontSize: 24,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Image(logoPdfImage, width: 50, height: 50),
                ],
              ),
              pw.SizedBox(height: 20),

              // Imagen y nombre del personaje
              pw.Center(
                child: pw.Column(
                  children: [
                    if (characterImage != null)
                      pw.Container(
                        width: 200,
                        height: 200,
                        decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(10),
                          border: pw.Border.all(
                            color: PdfColors.blue,
                            width: 3,
                          ),
                        ),
                        child: pw.ClipRRect(
                          horizontalRadius: 10,
                          verticalRadius: 10,
                          child: pw.Image(characterImage, fit: pw.BoxFit.cover),
                        ),
                      ),
                    pw.SizedBox(height: 20),
                    pw.Text(
                      character.name,
                      style: pw.TextStyle(
                        fontSize: 28,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blueGrey700,
                      ),
                    ),
                  ],
                ),
              ),

              pw.Divider(height: 30, thickness: 2),

              // Tabla de detalles
              _buildDetailRow('ID', character.id.toString()),
              _buildDetailRow('Estado', character.status),
              _buildDetailRow('Especie', character.species),
              _buildDetailRow(
                'Tipo',
                character.type.isEmpty ? 'N/A' : character.type,
              ),
              _buildDetailRow('Género', character.gender),

              pw.Spacer(),

              // Pie de página
              pw.Center(
                child: pw.Text(
                  'Generado por Practica 19 (Flutter PDF) - ${DateTime.now().year}',
                  style: const pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildDetailRow(String title, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Row(
        children: [
          pw.Container(
            width: 100,
            child: pw.Text(
              '$title:',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
            ),
          ),
          pw.Expanded(
            child: pw.Text(value, style: const pw.TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista Previa de Impresión'),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) => generatePdf(format, character),
        allowSharing: true,
        allowPrinting: true,
        canChangePageFormat: true,
      ),
    );
  }
}
