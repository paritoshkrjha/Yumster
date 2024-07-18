import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/common/widget/back_button.dart';
import 'package:yumster/core/common/widget/stepper.dart';
import 'package:yumster/core/utils.dart';
import 'package:yumster/data/providers/stepper_provider.dart';

class CreatePost extends ConsumerStatefulWidget {
  const CreatePost({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePostState();
}

class _CreatePostState extends ConsumerState<CreatePost> {
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
                int stepperIndex = ref.watch(stepperProvider);
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomStepper(steps: 4, active: stepperIndex),
                );
              },
            ),
            Expanded(
              child: PageView(
                children: [
                  Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text('Page 1'),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text('Page 2'),
                    ),
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
