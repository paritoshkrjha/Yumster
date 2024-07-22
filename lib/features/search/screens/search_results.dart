import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:yumster/core/common/widget/back_button.dart';

class SearchResultsScreen extends StatefulWidget {
  final Uint8List image;
  const SearchResultsScreen({super.key, required this.image});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  Future<GenerateContentResponse> fetchResults() {
    final apiKey = dotenv.env['API_KEY'];
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey!);
    final image = widget.image;
    final prompt = TextPart(
      'Based on the image, what kind of food dish is this? Can you provide a list of the main ingredients and, if possible, suggest a recipe for it?',
    );
    final imagePart = [
      DataPart('image/jpeg', image),
    ];
    final response = model.generateContent([
      Content.multi([prompt, ...imagePart])
    ]);
    return response;
  }

  Widget _buildResults(String instructions) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: MarkdownBody(data: instructions),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(
            onBack: () => context.pop(),
          ),
        ),
        body: FutureBuilder(
          future: fetchResults(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return _buildResults(snapshot.data!.text!);
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
