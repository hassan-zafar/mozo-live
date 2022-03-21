import 'package:flutter/material.dart';
import 'package:mozolive/Theme/colors.dart';
import 'package:mozolive/views/screens/Chat/comment_n_chat_sheet.dart';

class Comment {
  final String? image;
  final String? name;
  final String? comment;
  final String? time;
  final String? commentLikes;

  Comment({this.image, this.name, this.commentLikes, this.comment, this.time});
}

void commentSheet(BuildContext context) async {

  await showModalBottomSheet(
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: backgroundColor,
    shape: const OutlineInputBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        borderSide: BorderSide.none),
    context: context,
    builder: (context) => StatefulBuilder(
        builder: (context, setState) => SizedBox(
              // height: MediaQuery.of(context).size.height,
              // / 1.5,
              child: CommentsNChatSheet(
                isPostComment: true,
                isProductComment: false,
                postId: 'PostId',
                isAdmin: false,
              ),
              // Stack(
              //   children: <Widget>[
              //     FadedSlideAnimation(
              //       child:
              //        Column(
              //         crossAxisAlignment: CrossAxisAlignment.stretch,
              //         children: <Widget>[
              //           Padding(
              //             padding: const EdgeInsets.all(20.0),
              //             child: Text(
              //               locale.comments!,
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .headline6!
              //                   .copyWith(color: lightTextColor),
              //             ),
              //           ),
              //           Expanded(
              //             child: ListView.builder(
              //                 physics: const BouncingScrollPhysics(),
              //                 padding: const EdgeInsets.only(bottom: 60.0),
              //                 itemCount: comments.length,
              //                 itemBuilder: (context, index) {
              //                   return Column(
              //                     children: <Widget>[
              //                       Divider(
              //                         color: darkColor,
              //                         thickness: 1,
              //                       ),
              //                       ListTile(
              //                         leading: Image.asset(
              //                           comments[index].image!,
              //                           scale: 2.3,
              //                         ),
              //                         title: Text(comments[index].name!,
              //                             style: Theme.of(context)
              //                                 .textTheme
              //                                 .bodyText2!
              //                                 .copyWith(
              //                                     height: 2,
              //                                     color: disabledTextColor)),
              //                         subtitle: RichText(
              //                           text: TextSpan(children: [
              //                             TextSpan(
              //                               text: comments[index].comment,
              //                             ),
              //                             TextSpan(
              //                                 text: comments[index].time,
              //                                 style: Theme.of(context)
              //                                     .textTheme
              //                                     .caption),
              //                           ]),
              //                         ),
              //                         trailing: ImageIcon(
              //                           const AssetImage(
              //                               'assets/icons/ic_like.png'),
              //                           color: disabledTextColor,
              //                         ),
              //                       ),
              //                     ],
              //                   );
              //                 }),
              //           )
              //         ],
              //       ),
              //       beginOffset: const Offset(0, 0.3),
              //       endOffset: const Offset(0, 0),
              //       slideCurve: Curves.linearToEaseOut,
              //     ),
              //     Align(
              //       alignment: Alignment.bottomCenter,
              //       child: EntryField(
              //         counter: null,
              //         padding: EdgeInsets.zero,
              //         hint: locale.writeYourComment,
              //         fillColor: darkColor,
              //         prefix: Padding(
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 16.0, vertical: 8.0),
              //           child: CircleAvatar(
              //               backgroundImage: CachedNetworkImageProvider(
              //                   currentUser!.imageUrl!)
              //               // AssetImage('assets/images/user.webp'),
              //               ),
              //         ),
              //         suffixIcon: Icon(
              //           Icons.send,
              //           color: mainColor,
              //         ),
              //       ),
              //     ),

              //   ],
              // ),
            )),
  );
}
