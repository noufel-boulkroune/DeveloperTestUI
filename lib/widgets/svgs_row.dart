import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/list_users_provider.dart';

class SvgsRow extends StatelessWidget {
  const SvgsRow({
    super.key,
    required this.devicePadding,
  });
  final Map<String, double> devicePadding;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ListUsersProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: devicePadding["XXL"] as double,
          vertical: devicePadding["M"] as double),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/svgs/Map.svg",
            color: Colors.black,
          ),
          SvgPicture.asset(
            "assets/svgs/Comment.svg",
            color: Colors.black,
          ),
          Consumer<ListUsersProvider>(
            builder: (_, value, __) {
              return GestureDetector(
                onTap: () {
                  userData.likeImage();
                },
                child: Container(
                  width: 25,
                  height: 25,
                  child: SvgPicture.asset(
                    userData.isLiked
                        ? "assets/svgs/Heart.svg"
                        : "assets/svgs/Like.svg",
                    color: userData.isLiked ? Colors.red : Colors.black,
                  ),
                ),
              );
            },
          ),
          SvgPicture.asset(
            "assets/svgs/Share.svg",
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
