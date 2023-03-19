import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ShowHtmlCode extends StatelessWidget {


  final String htmlCode;
  const ShowHtmlCode({Key? key, required this.htmlCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return Html(

        data: htmlCode??'',
        style:{
          "table":Style(
            backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            width: size.width,
          ),
          "tr":Style(
            border: const Border(bottom: BorderSide(color: Colors.grey)),
          ),
          "th":Style(
            padding: const EdgeInsets.all(6),
            backgroundColor: Colors.grey,
          ),
          "td":Style(
            padding: const EdgeInsets.all(6),
            alignment: Alignment.topLeft,
            width: size.width * 0.45,

          ),
          "h1":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!, fontSize: FontSize.large
          ),
          "h2":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!,fontSize: FontSize.large
          ),
          "h3":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!,fontSize: FontSize.large
          ),
          "h4":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!,fontSize: FontSize.large
          ),
          "h5":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!,fontSize: FontSize.large
          ),
          "h6":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!,fontSize: FontSize.large
          ),
          "p":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!,fontSize: FontSize.large
          ),
          "span":Style(
              color: Theme.of(context).textTheme.titleMedium?.color!,fontSize: FontSize.medium
          ),
          "":Style(
              fontSize: FontSize.large, color: Colors.red
          )

        }


    );
  }
}