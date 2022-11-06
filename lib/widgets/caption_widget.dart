import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/list_users_provider.dart';

class CaptionWidget extends StatelessWidget {
  const CaptionWidget({
    super.key,
    required this.userName,
    required this.captionText,
    required this.devicePadding,
  });

  final String userName;
  final String captionText;
  final Map<String, double> devicePadding;

  @override
  Widget build(BuildContext context) {
    //

    final userData = Provider.of<ListUsersProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(
          left: devicePadding["S"] as double,
          right: devicePadding["S"] as double,
          bottom: devicePadding["XS"] as double),
      child: (userName.length * 8 + captionText.length * 8) <
              MediaQuery.of(context).size.width
          ? Text.rich(
              TextSpan(
                  text: "$userName",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: " "),
                    TextSpan(
                        text: "$captionText",
                        style: TextStyle(fontWeight: FontWeight.normal))
                  ]),
            )
          // Text("$userName " "$captionText  ")
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    "$userName " "$captionText",
                    maxLines: userData.captionLineNumbre,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      userData.changeCaptionMaxLine();
                    },
                    child: Text(
                      userData.captionLineNumbre == 3 ? "  Less" : "  more",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
    );
  }
}


 //ReadMoreText(
        //   "${userName} " "$captionText",
        //   trimLines: 1,

        //   colorClickableText: Colors.pink,
        //   style: TextStyle(),

        //   trimMode: TrimMode.Line,
        //   trimCollapsedText: 'Show more',
        //   trimExpandedText: 'Show less',
        //   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //   lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        // )),
        //
