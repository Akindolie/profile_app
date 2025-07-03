import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => downloadAndOpenPdf(
            'https://raw.githubusercontent.com/Akindolie/resume_flutter/main/AKINLOYE%20MICHAEL%20AKINDOLIE.pdf',
            '001_MICHAEL_AKINDOLIE.pdf',
          ),
          child: Text('Download Resume'),
        ),
      ],
    );
  }
}

Future<void> downloadAndOpenPdf(String url, String fileName) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print('PDF saved at: $filePath');

      // Open the file
      OpenFile.open(filePath);
    } else {
      print('Failed to download PDF. Status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
