import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/list_users_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class MediaImageWidget extends StatelessWidget {
  const MediaImageWidget(
      {super.key, required this.mediaImagesList, required this.devicePadding});
  final List mediaImagesList;
  final Map<String, double> devicePadding;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ListUsersProvider>(context, listen: false);

    return GestureDetector(
      onDoubleTap: () {
        if (!userData.isLiked) {
          userData.shouldShowHeart();
        }

        userData.likeImage();
      },
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 0.9,
          viewportFraction: 1,
          enableInfiniteScroll: false,
        ),
        items: mediaImagesList.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return BlurHash(hash: image.blurHash, image: image.url);
            },
          );
        }).toList(),
      ),
    );
  }
}
