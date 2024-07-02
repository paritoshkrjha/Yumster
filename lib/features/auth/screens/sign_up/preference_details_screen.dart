import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumster/core/constants/constants.dart';
import 'package:yumster/core/constants/screen_constants.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/core/utils.dart';
import 'package:yumster/features/auth/controller/auth_controller.dart';

class PreferenceDetailsScreen extends StatefulWidget {
  const PreferenceDetailsScreen({super.key});

  @override
  State<PreferenceDetailsScreen> createState() =>
      _PreferenceDetailsScreenState();
}

class _PreferenceDetailsScreenState extends State<PreferenceDetailsScreen> {
  final List<String> _preferenceList = [];

  _handleBack(WidgetRef ref) {
    AuthController().handleBack(ref);
  }

  _handleSignUp(ref) {
    if (_preferenceList.isEmpty) {
      Utils().showAlertDialog(
        context,
        ScreenConstants.preferenceDetailsScreenConstants['alertTitle']!,
        ScreenConstants.preferenceDetailsScreenConstants['alertContent']!,
      );
      return;
    }
    context.goNamed('loading', pathParameters: {
      "isLogin": "false",
    });
    Utils().addDelay(2);
    AuthController().handleSignUp(
      preferences: _preferenceList,
      ref: ref,
      context: context,
    );
  }

  Widget _preferenceTile(label, value) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            if (_preferenceList.contains(value)) {
              _preferenceList.remove(value);
            } else {
              _preferenceList.add(value);
            }
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                _preferenceList.contains(value)
                    ? Iconsax.tick_circle
                    : Iconsax.add_circle,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label.toString(),
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ScreenConstants.preferenceDetailsScreenConstants['title']!,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            ScreenConstants.preferenceDetailsScreenConstants['subtitle']!,
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: StaggeredGrid.count(
                crossAxisCount: 5,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['veg']!['label'],
                        Constants.recipePreferences['veg']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['nonVeg']!['label'],
                        Constants.recipePreferences['nonVeg']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['dairyFree']!['label'],
                        Constants.recipePreferences['dairyFree']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['vegan']!['label'],
                        Constants.recipePreferences['vegan']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['italian']!['label'],
                        Constants.recipePreferences['italian']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['chinese']!['label'],
                        Constants.recipePreferences['chinese']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['indian']!['label'],
                        Constants.recipePreferences['indian']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['mexican']!['label'],
                        Constants.recipePreferences['mexican']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['snacks']!['label'],
                        Constants.recipePreferences['snacks']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['deserts']!['label'],
                        Constants.recipePreferences['deserts']!['value']),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 5,
                    mainAxisCellCount: 1,
                    child: _preferenceTile(
                        Constants.recipePreferences['mainCourse']!['label'],
                        Constants.recipePreferences['mainCourse']!['value']),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return Expanded(
                    child: ElevatedButton(
                      onPressed: () => _handleBack(ref),
                      child: Text(
                        ScreenConstants
                            .preferenceDetailsScreenConstants['backCta']!,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Consumer(
                builder: (context, ref, child) => Expanded(
                  child: ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const WidgetStatePropertyAll(
                                Palette.accentColor,
                              ),
                            ),
                    onPressed: () => _handleSignUp(ref),
                    child: Text(
                      ScreenConstants
                          .preferenceDetailsScreenConstants['buttonText']!,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
