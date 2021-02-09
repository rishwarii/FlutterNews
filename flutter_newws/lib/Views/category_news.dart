import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newws/Views/home.dart';
import 'package:flutter_newws/helper/news.dart';
import 'package:flutter_newws/models/article_model.dart';
import 'tiles.dart';


class Category_News extends StatefulWidget {

  final String category ;

  const Category_News({Key key, this.category}) : super(key: key);
  @override
  _Category_NewsState createState() => _Category_NewsState();
}

class _Category_NewsState extends State<Category_News> {
  List<ArticleModel> articles = new List<ArticleModel>() ;
  bool _loading = true  ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory_News() ;

  }

  getCategory_News()async{
    CategoryNewsClass newsClass =  CategoryNewsClass() ;
    await newsClass.getNews(widget.category) ;
    articles  = newsClass.news ;
    setState(() {
      _loading = false  ;
    });

  }



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



      body:_loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
     : Padding(
       padding: const EdgeInsets.only(top : 8.0),
       child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListView.builder(
                      itemCount: articles.length ,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context , index ){
                        return BlogTile(
                          imgUrl: articles[index].urlToimg  ?? "",
                          title:  articles[index].title ?? " " ,
                          description: articles[index].description ?? "",
                          url: articles[index].url  ?? "Could Not Fetch URL",
                        ) ;
                      }),
                )
              ],
            ),
          ),
        ),
     ),
    );
  }
}
