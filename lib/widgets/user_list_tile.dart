import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.userName,
    required this.fullName,
    required this.photoUrl,
    required this.devicePadding,
  });

  final String userName;
  final String fullName;
  final String photoUrl;
  final Map<String, double> devicePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: devicePadding["S"] as double,
            right: devicePadding["S"] as double,
            top: devicePadding["S"] as double),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[500],
              maxRadius: 30,
              backgroundImage: NetworkImage(photoUrl),
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
                      userName,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: devicePadding["XXXS"],
                    ),
                    Text(
                      fullName,
                      maxLines: 1,
                      style:
                          const TextStyle(fontSize: 17, color: Colors.white54),
                    )
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/svgs/Options.svg",
              color: Colors.white,
              fit: BoxFit.scaleDown,
              height: 30,
            ),
          ],
        ));
  }
}




// return Positioned(
//       child: Container(
//         color: Colors.black12,
//         child: ListTile(
//           title: Text(
//             userName,
//             style: TextStyle(color: Colors.white, fontSize: 19),
//             maxLines: 1,
//             overflow: TextOverflow.clip,
//           ),
//           subtitle: Text(
//             fullName,
//             style: TextStyle(fontSize: 16, color: Colors.grey[500]),
//             maxLines: 1,
//             overflow: TextOverflow.clip,
//           ),
//           leading: CircleAvatar(
//             backgroundColor: Colors.white38,
//             maxRadius: 30,
//             backgroundImage: NetworkImage(photoUrl),
//           ),
//           trailing: Container(
//               width: 35,
//               child: SvgPicture.asset(
//                 "assets/svgs/Options.svg",
//                 color: Colors.white,
//               )),
//         ),
//       ),
//     );

