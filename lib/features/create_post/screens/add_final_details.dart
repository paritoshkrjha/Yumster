import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/data/providers/recipe_list_provider.dart';
import 'package:yumster/features/create_post/controller/create_post_controller.dart';

class AddFinalDetailsPage extends ConsumerStatefulWidget {
  const AddFinalDetailsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddFinalDetailsPageState();
}

class _AddFinalDetailsPageState extends ConsumerState<AddFinalDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _mealType;
  String _cuisineType = '';
  int _duration = 0;
  bool _isVeg = false;
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isDairyFree = false;

  _handlePostRecipe() async {
    FocusScope.of(context).unfocus();
    final validate = CreatePostController().validateForm(formKey: _formKey);
    if (!validate) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    CreatePostController().handlePostRecipe(
        mealType: _mealType,
        isVeg: _isVeg,
        isGlutenFree: _isGlutenFree,
        isVegan: _isVegan,
        isDairyFree: _isDairyFree,
        cuisineType: _cuisineType,
        duration: _duration,
        ref: ref,
        onFailure: (message) {
          Fluttertoast.showToast(msg: message);
        },
        onSuccess: (recipe) {
          ref.read(recipeListProvider.notifier).addRecipeToList(recipe);
          Fluttertoast.showToast(msg: 'Recipe posted successfully!');
          context.go('/home');
        });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Final Details',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Add final details for your recipe',
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duration of Recipe',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                          cursorColor: Colors.black87,
                          decoration: const InputDecoration(
                            hintText: 'Enter duration (e.g., 30 mins)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the duration';
                            }
                            return null;
                          },
                          onSaved: (newValue) => {
                                _duration = int.parse(newValue!),
                              }),
                      const SizedBox(height: 20),
                      Text(
                        'Cuisine Type',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'e.g., Italian, Indian',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the type of cuisine';
                            }
                            return null;
                          },
                          onSaved: (newValue) => {
                                _cuisineType = newValue!,
                              }),
                      const SizedBox(height: 20),
                      Text(
                        'Meal Type',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 5),
                      DropdownButtonFormField<String>(
                        value: _mealType,
                        hint: const Text('Select meal type'),
                        onChanged: (String? newValue) {
                          setState(() {
                            _mealType = newValue;
                          });
                        },
                        items: <String>[
                          'breakfast',
                          'lunch',
                          'dinner',
                          'snack',
                          'dessert'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a meal type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Dietary Restrictions',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Select any dietary restrictions. Toggle, if it holds true for the recipe.',
                      ),
                      SwitchListTile(
                        activeColor: Colors.green,
                        title: const Text('Vegetarian'),
                        value: _isVeg,
                        onChanged: (bool value) {
                          setState(() {
                            _isVeg = value;
                          });
                        },
                        secondary: const Icon(Icons.fastfood),
                      ),
                      SwitchListTile(
                        activeColor: Colors.green,
                        title: const Text('Gluten-Free'),
                        value: _isGlutenFree,
                        onChanged: (bool value) {
                          setState(() {
                            _isGlutenFree = value;
                          });
                        },
                        secondary: const Icon(Icons.no_food),
                      ),
                      SwitchListTile(
                        activeColor: Colors.green,
                        title: const Text('Dairy-Free'),
                        value: _isDairyFree,
                        onChanged: (bool value) {
                          setState(() {
                            _isDairyFree = value;
                          });
                        },
                        secondary: const Icon(Icons.no_drinks),
                      ),
                      SwitchListTile(
                        activeColor: Colors.green,
                        title: const Text('Vegan'),
                        value: _isVegan,
                        onChanged: (bool value) {
                          setState(() {
                            _isVegan = value;
                          });
                        },
                        secondary: const Icon(Icons.eco),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _handlePostRecipe,
            child: _isLoading
                ? const CustomLoader(color: Colors.white)
                : const Text('Post Recipe'),
          ),
        ],
      ),
    );
  }
}
