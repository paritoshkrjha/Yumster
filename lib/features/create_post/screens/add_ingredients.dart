import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/core/utils.dart';
import 'package:yumster/data/providers/new_recipe_provider.dart';
import 'package:yumster/features/create_post/controller/create_post_controller.dart';

class AddIngredientsPage extends ConsumerStatefulWidget {
  const AddIngredientsPage({super.key});

  @override
  ConsumerState<AddIngredientsPage> createState() => _AddIngredientsPageState();
}

class _AddIngredientsPageState extends ConsumerState<AddIngredientsPage> {
  bool _isLoading = false;
  List<String> _ingredients = [];
  final TextEditingController _controller = TextEditingController();

  _handleNext() async {
    if (_ingredients.isEmpty) {
      Utils().showAlertDialog(
          context, 'Alert', 'Please add ingredients to proceed.');
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    CreatePostController().handleSaveIngredients(
      ingredients: _ingredients,
      ref: ref,
    );
  }

  void _addIngredient() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _ingredients.add(_controller.text.trim());
        _controller.clear();
      });
    }
  }

  void _removeIngredient(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Ingredient ?'),
          content:
              Text('Ingredient \'${_ingredients[index]}\' will be deleted.'),
          actions: [
            TextButton(
              child: Text(
                'Delete',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onPressed: () {
                setState(() {
                  _ingredients.removeAt(index);
                });
                context.pop();
              },
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getInitialValues();
  }

  getInitialValues() {
    _ingredients = ref.read(newRecipeProvider).ingredients;
  }

  Widget _showList(List<String> list) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'List of Ingredients',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Expanded(
            child: list.isEmpty
                ? const Center(
                    child: Text('No ingredients added yet!'),
                  )
                : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${index + 1}.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey.shade800),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                list[index],
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () => _removeIngredient(index),
                            icon: const Icon(
                              Iconsax.close_circle5,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Add ingredients for your recipe',
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          cursorColor: Colors.black87,
                          decoration: const InputDecoration(
                            hintText: 'Enter required ingredients.',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        style: const ButtonStyle(
                          side: WidgetStatePropertyAll(
                            BorderSide(color: Colors.green),
                          ),
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: _addIngredient,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _showList(_ingredients),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: _handleNext,
            style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50)),
            child: _isLoading
                ? const CustomLoader(color: Colors.white)
                : const Text('Next', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
