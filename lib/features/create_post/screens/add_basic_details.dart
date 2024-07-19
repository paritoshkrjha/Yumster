import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/data/providers/new_recipe_provider.dart';
import 'package:yumster/features/create_post/controller/create_post_controller.dart';

class AddBasicDetailsPage extends ConsumerStatefulWidget {
  const AddBasicDetailsPage({super.key});

  @override
  ConsumerState<AddBasicDetailsPage> createState() =>
      _AddBasicDetailsPageState();
}

class _AddBasicDetailsPageState extends ConsumerState<AddBasicDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  var _recipeName = '';
  var _recipeDescription = '';

  getInitialValues() {
    _recipeName = ref.read(newRecipeProvider).title;
    _recipeDescription = ref.read(newRecipeProvider).description;
  }

  _handleNext() async {
    FocusScope.of(context).unfocus();
    final validate = CreatePostController().validateForm(formKey: _formKey);
    if (!validate) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    CreatePostController().handleSaveBasicDetails(
      recipeName: _recipeName,
      recipeDescription: _recipeDescription,
      ref: ref,
    );
  }

  @override
  void initState() {
    super.initState();
    getInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic Details',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Enter basic details of your recipe',
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recipe name',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      cursorColor: Colors.black87,
                      initialValue: '',
                      decoration: const InputDecoration(
                        hintText: 'Enter recipe name',
                      ),
                      validator: (newValue) {
                        if (newValue!.isEmpty) {
                          return 'Please enter recipe name';
                        }
                        return null;
                      },
                      onSaved: (newValue) => {
                        _recipeName = newValue!,
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Recipe description',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      maxLength: 200,
                      maxLines: 5,
                      cursorColor: Colors.black87,
                      initialValue: '',
                      decoration: const InputDecoration(
                        hintText: 'Describe your recipe',
                      ),
                      validator: (newValue) {
                        if (newValue!.isEmpty) {
                          return 'Please enter recipe description';
                        }
                        return null;
                      },
                      onSaved: (newValue) => {
                        _recipeDescription = newValue!,
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
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
