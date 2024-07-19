import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/common/widget/back_button.dart';
import 'package:yumster/core/common/widget/stepper.dart';
import 'package:yumster/core/utils.dart';
import 'package:yumster/data/providers/create_post_pageview_controller_provider.dart';
import 'package:yumster/data/providers/stepper_provider.dart';
import 'package:yumster/features/create_post/screens/add_basic_details.dart';
import 'package:yumster/features/create_post/screens/add_ingredients.dart';
import 'package:yumster/features/create_post/screens/add_steps.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<StatefulWidget> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(
            onBack: () => Utils().showConfirmationDialog(
                context,
                'Discard Post?',
                'If you go back now, all the post edits will be lost.'),
          ),
          title: const Text('Create Post'),
        ),
        body: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                int activeIndex = ref.watch(stepperProvider);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomStepper(
                    steps: 4,
                    active: activeIndex,
                  ),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final pageIndexController =
                    ref.watch(createPostPageViewControllerProvider);
                return Expanded(
                  child: PageView(
                    controller: pageIndexController,
                    children: [
                      const AddBasicDetailsPage(),
                      const AddIngredientsPage(),
                      const AddStepsPage(),
                      Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text('Page 3'),
                        ),
                      ),
                      Container(
                        color: Colors.yellow,
                        child: const Center(
                          child: Text('Page 4'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
