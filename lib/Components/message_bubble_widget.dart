import 'package:flutter/material.dart';
import 'package:mozolive/Theme/colors.dart';
import 'package:mozolive/Theme/style.dart';

class MessageBubble extends StatelessWidget {
  final bool? isMe;
  final String? text;
  final String? time;
  final bool? isDelivered;

  const MessageBubble(
      {Key? key, this.text, this.time, this.isMe, this.isDelivered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: isMe!
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  time!,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(width: 12.0),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [btnGradLeft, btnGradRight]),
                    borderRadius: radius,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    text!,
                    textAlign: TextAlign.end,
                    style: const TextStyle(height: 1.4),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 2 / 3),
                  decoration: BoxDecoration(
                    color: disabledTextColor,
                    borderRadius: radius,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    text!,
                    style: const TextStyle(height: 1.4),
                  ),
                ),
                const SizedBox(width: 12.0),
                Text(
                  time!,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
    );
  }
}
