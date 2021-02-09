
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_newws/models/article_model.dart';
import 'package:http/http.dart' as http ;


class News {
  List<ArticleModel> news = [];

 Future<void> getNews() async{

   String url = "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=43873a94b17341fda861d353fb276d90";

   var response = await http.get(url) ;
   var jsondata = jsonDecode(response.body) ;

   if(jsondata['status'] == 'ok'){// elemts image not available , or decryption
     jsondata['articles'].forEach((element){

       if (element['urlToImage'] != null && element['description'] != null ) {

         ArticleModel  articleModel =  ArticleModel(
            title : element['title'] ,
           author : element["author"] ,
           description: element['description'] ,
           url: element['url'] ,
           urlToimg: element['urlToImage'] ,
         );
         
         news.add(articleModel);
       }  

     });
   }
 }

}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category ) async{

    String url = "http://newsapi.org/v2/top-headlines?category=$category&country=in&category=business&apiKey=43873a94b17341fda861d353fb276d90";

    var response = await http.get(url) ;
    var jsondata = jsonDecode(response.body) ;

    if(jsondata['status'] == 'ok'){// elemts image not available , or decryption
      jsondata['articles'].forEach((element){

        if (element['urlToImage'] != null && element['description'] != null ) {

          ArticleModel  articleModel =  ArticleModel(
            title : element['title'] ,
            author : element["author"] ,
            description: element['description'] ,
            url: element['url'] ,
            urlToimg: element['urlToImage'] ,
          );

          news.add(articleModel);
        }

      });
    }
  }

}

class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(icon: Icon(Icons.clear), onPressed: null)
    ] ;

    //actions of search bar

  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
    progress: transitionAnimation ,
    )
        , onPressed: null) ;



    //leading icon on left
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();

    //show results
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();

    // show suggestions when types
  }
  
}