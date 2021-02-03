import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleView extends StatefulWidget {

  final String blogURL  ;

  const ArticleView({Key key, this.blogURL}) : super(key: key);


  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
final Completer<WebViewController> _completer = Completer<WebViewController>() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("INSTA") ,
            Text("News" , style: TextStyle(
                color: Colors.blueAccent
            ),)

          ],
        ),
        elevation: 1 ,
      ),
      body: Container(

        child: WebView(
          initialUrl: widget.blogURL,
          onWebViewCreated: (WebViewController webViewController ){
            _completer.complete(webViewController) ;
          },
        ),
      ),
    );
  }
}
