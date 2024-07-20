import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/data/repository/profile_repository.dart';

class ProfileController {
  void deletePost(String postId, WidgetRef ref) async {
    String? token = await DeviceStorage().read(key: 'token');
    final resposne =
        await ProfileRepository().deletePost(postId: postId, token: token!);
    resposne.fold((l) => Fluttertoast.showToast(msg: l.message), (user) {
      ref.read(userProvider.notifier).updatePosts(user.posts);
      Fluttertoast.showToast(msg: 'Post deleted successfully');
    });
  }
}
