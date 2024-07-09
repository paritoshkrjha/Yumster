import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yumster/core/common/widget/back_button.dart';
import 'package:yumster/data/model/recipe_model.dart';

class ViewRecipeScreen extends StatefulWidget {
  final String recipeId;
  const ViewRecipeScreen({super.key, required this.recipeId});

  @override
  State<ViewRecipeScreen> createState() => _ViewRecipeScreenState();
}

class _ViewRecipeScreenState extends State<ViewRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(
            onBack: () => context.pop(),
          ),
        ),
        body: Center(child: Text('Recipe ID: ${widget.recipeId}')));
  }
}
