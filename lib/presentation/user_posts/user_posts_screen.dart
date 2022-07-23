import 'package:cached_network_image/cached_network_image.dart';
import 'package:floward/presentation/user_posts/user_posts_argument.dart';
import 'package:floward/styles/colors.dart';
import 'package:floward/styles/dimens.dart';
import 'package:floward/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPostsScreen extends StatelessWidget {
  const UserPostsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as UserPostArgument;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: Dimens.flexibleAppBarHeight,
            backgroundColor: transparentColor,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(Dimens.radiusRounded),
                ),
                child: CachedNetworkImage(
                  imageUrl: args.user.url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ...args.userPosts.map<Widget>(
            (post) => Card(
              margin: EdgeInsets.all(Dimens.marginH16),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.marginW16,
                  vertical: Dimens.marginH8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      post.title,
                      style: titleStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Dimens.marginH16,
                    ),
                    Text(
                      post.body,
                      style: bodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ).sliverBox,
          ),
        ],
      ),
    );
  }
}
