import 'package:flutter/material.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TableClickableText extends StatefulWidget {
  final String text1;
  final String urlText;
  final String url;

  const TableClickableText({
    Key? key,
    required this.text1,
    required this.urlText,
    required this.url,
  }) : super(key: key);

  @override
  State<TableClickableText> createState() => _TableClickableTextState();
}

class _TableClickableTextState extends State<TableClickableText> {
  String truncateTextWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrlString(widget.url)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.0389,
            ),
            Text(
              truncateTextWithEllipsis(widget.text1, 25),
              style: AppFonts.body2(
                color: AppColors.grayscale70,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: _launchUrl,
              child: Text(
                widget.urlText,
                style: AppFonts.body2(
                  color: AppColors.grayscale90,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.0389,
            ),
          ],
        ),
      ],
    );
  }
}


// Exapmle of use:

// const TableClickableText(
//                     text1: 'Clickable Text',
//                     urlText: 'Email@gmail.com',
//                     url: "https://www.google.com/",
//                   ),