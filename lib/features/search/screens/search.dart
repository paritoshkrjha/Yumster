import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/core/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Uint8List? _image;

  _navigateToSearchResults(Uint8List image) {
    Fluttertoast.showToast(
      msg: 'Picture selected, please wait...',
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
    context.pushNamed('searchResults', extra: image);
  }

  _captureImage() async {
    Uint8List? img = await Utils().pickImage(ImageSource.gallery);
    if (img == null) {
      Fluttertoast.showToast(
        msg: 'Please select an image',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return;
    }

    _image = img;
    _navigateToSearchResults(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text('What\'s on your plate?',
              style: Theme.of(context).textTheme.titleLarge),
          Text(
            'Snap a picture to identify any dish.',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.accentColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: _captureImage,
              child: const Row(
                children: [
                  Icon(Iconsax.camera),
                  SizedBox(width: 10),
                  Text('Take a picture'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Tips for a better result: \n',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '1. Lighting is Key : ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: 'Capture the dish in good lighting.\n',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
                TextSpan(
                  text: '2. Focus on the Food : ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: 'Make sure the dish is the main focus of the picture.',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
