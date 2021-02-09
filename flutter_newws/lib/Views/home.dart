import 'dart:html';
import 'tiles.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_newws/Views/category_news.dart';
import 'package:flutter_newws/helper/news.dart';
import 'package:flutter_newws/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_newws/helper/data.dart';
import 'package:flutter_newws/models/category_model.dart';

import 'article_view.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override


  List<Category_Model> categories = new List<Category_Model>() ;
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true ;
  void initState(){
    super.initState() ;
        categories = getCategory() ;
        getNews() ;

  }

  getNews()async{
    News newsClass =  News() ;
    await newsClass.getNews() ;
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
     actions: [
       IconButton(icon: Icon(Icons.search), onPressed: (){})
     ], ),
      drawer: Drawer(
        child: Center(
          child:ListView(
            children: [
              DrawerHeader(
                child: Text(
                  ""
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box_outlined),
                title: Text("Account Name"),
                
              )
            ],

          ),
        )
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),

      ) : SingleChildScrollView(
        child: Container(
        child: Column(
          children: <Widget>[

            Container(
              ///categories
              ///
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 85,
              child: ListView.builder(
                  itemCount : categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (context , index){
                    return CategoryTile(
                      imageURL:categories[index].imgurl ,
                      categoryname: categories[index].category_name ,
                    );
                  }
            )
            ),
            ///blogs

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
    );
  }
}

