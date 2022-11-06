import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/list_users_provider.dart';

class SpotListTile extends StatelessWidget {
  const SpotListTile({
    super.key,
    required this.spotName,
    required this.locationName,
    required this.spotType,
    required this.logoImage,
    required this.userId,
    required this.isSaved,
    required this.devicePadding,
  });
  final String spotName;
  final String locationName;
  final List spotType;
  final String logoImage;
  final String userId;
  final bool isSaved;
  final Map<String, double> devicePadding;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ListUsersProvider>(context, listen: false);
    return Container(
        width: MediaQuery.of(context).size.width - (2 * devicePadding["S"]!),
        margin: EdgeInsets.only(
            left: devicePadding["S"] as double,
            right: devicePadding["S"] as double,
            bottom: devicePadding["S"] as double),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white38,
              maxRadius: 30,
              backgroundImage: NetworkImage(logoImage),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(
                    left: devicePadding["S"] as double,
                    right: devicePadding["S"] as double),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      spotName,
                      maxLines: 1,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      height: devicePadding["XXXS"],
                    ),
                    locationName == ""
                        ? Text(
                            "${spotType[0].name}",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[500]),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          )
                        : Text(
                            "${spotType[0].name} " "- ${locationName}",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[500]),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                userData.isSpotFavorite(userId);
              },
              child: Consumer<ListUsersProvider>(
                builder: (_, value, __) {
                  return Consumer<ListUsersProvider>(
                    builder: (_, value, __) => Container(
                        child: !isSaved
                            ? SvgPicture.asset(
                                "assets/svgs/Star Border.svg",
                                color: Colors.white,
                                fit: BoxFit.scaleDown,
                                height: 30,
                              )
                            : SvgPicture.asset(
                                "assets/svgs/Star.svg",
                                color: Colors.yellow,
                                fit: BoxFit.scaleDown,
                                height: 30,
                              )),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
// }
// Positioned(
//       width: MediaQuery.of(context).size.width,
//       bottom: 0,
//       child: Container(
//         color: Colors.black12,
//         child: ListTile(
//           title: Text(
//             "${spotName} ",
//             style: TextStyle(color: Colors.white, fontSize: 19),
//             maxLines: 1,
//           ),
//           subtitle: locationName == ""
//               ? Text(
//                   "${spotType[0].name}",
//                   style: TextStyle(fontSize: 16, color: Colors.grey[500]),
//                   maxLines: 1,
//                   overflow: TextOverflow.clip,
//                 )
//               : Text(
//                   "${spotType[0].name} " "- ${locationName}",
//                   style: TextStyle(fontSize: 16, color: Colors.grey[500]),
//                   maxLines: 1,
//                   overflow: TextOverflow.clip,
//                 ),
//           leading: CircleAvatar(
//             backgroundColor: Colors.white38,
//             maxRadius: 30,
//             backgroundImage: NetworkImage(logoImage),
//           ),
//           trailing: GestureDetector(
//             onTap: () {
//               userData.isSpotFavorite(userId);
//             },
//             child: Consumer<ListUsersProvider>(
//               builder: (_, value, __) {
//                 return Consumer<ListUsersProvider>(
//                   builder: (_, value, __) => Container(
//                       width: 35,
//                       child: !isSaved
//                           ? SvgPicture.asset(
//                               "assets/svgs/Star Border.svg",
//                               color: Colors.white,
//                             )
//                           : SvgPicture.asset(
//                               "assets/svgs/Star.svg",
//                               color: Colors.yellow,
//                             )),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     )