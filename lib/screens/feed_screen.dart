import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/providers/list_users_provider.dart';

import '/constants/screens_dimensions.dart';

import '/widgets/caption_widget.dart';
import '/widgets/media_image_wigdet.dart';
import '/widgets/spot_list_tile.dart';
import '/widgets/svgs_row.dart';
import '/widgets/tags_widget.dart';
import '/widgets/user_list_tile.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    Provider.of<ListUsersProvider>(context, listen: false).getAllUserData();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   Provider.of<ListUsersProvider>(context).getAllUserData();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ListUsersProvider>(context).usersList;
    final isLoading = Provider.of<ListUsersProvider>(context).isLoading;
    final shouldShow = Provider.of<ListUsersProvider>(context).shouldShow;

    //

    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHight = MediaQuery.of(context).size.height;
    Map<String, double> devicePadding = {};
    if (deviceHight < 667 && deviceWidth < 320) {
      devicePadding = smallScreen;
    } else if (deviceHight < 812 && deviceWidth < 375) {
      devicePadding = mediumScreen;
    } else if (deviceHight < 926 && deviceWidth < 428) {
      devicePadding = largeScreen;
    } else {
      devicePadding = largeScreen;
    }

    //

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          "feed",
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () {
                return Provider.of<ListUsersProvider>(context, listen: false)
                    .getAllUserData();
              },
              child: ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: MediaImageWidget(
                              mediaImagesList: userData[index].media,
                              devicePadding: devicePadding,
                            ),
                          ),
                          Positioned(
                            child: UserListTile(
                              userName: userData[index].author.username,
                              fullName: userData[index].author.fullName,
                              photoUrl: userData[index].author.photoUrl,
                              devicePadding: devicePadding,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: SpotListTile(
                              spotName: userData[index].spot.name,
                              locationName: userData[index].spot.name,
                              spotType: userData[index].spot.types,
                              logoImage: userData[index].spot.logo.url,
                              userId: userData[index].id,
                              isSaved: userData[index].spot.isSaved,
                              devicePadding: devicePadding,
                            ),
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: shouldShow
                                  ? Container(
                                      child: Center(
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          child: SvgPicture.asset(
                                            "assets/svgs/Heart.svg",
                                            color: Colors.red,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container()),
                        ],
                      ),
                      SvgsRow(
                        devicePadding: devicePadding,
                      ),
                      CaptionWidget(
                        userName: userData[index].author.username,
                        captionText: userData[index].caption.text,
                        devicePadding: devicePadding,
                      ),
                      TagsWidget(
                        tags: userData[index].caption.tags as List,
                        devicePadding: devicePadding,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: devicePadding["S"] as double,
                          right: devicePadding["S"] as double,
                          top: devicePadding["S"] as double,
                          bottom: devicePadding["L"] as double,
                        ),
                        child: Text(
                          "${DateTime.now().difference(userData[index].createdAt).inDays} days ago ",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
