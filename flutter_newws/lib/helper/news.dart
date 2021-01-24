
import 'dart:convert';

import 'package:flutter_newws/models/article_model.dart';
import 'package:http/http.dart' as http ;


class News {
  List<ArticleModel> news = [];

 Future<void> getNews() async{

   String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=43873a94b17341fda861d353fb276d90";

   var response = await http.get(url) ;
   var jsondata = jsonDecode(response.body) ;

   if(jsondata['staus'] == 'ok'){// elemts image not available , or decryption
     jsondata['articles'].forEach((element){

       if (element['urlToImage'] != null && element['description'] != null ) {

         ArticleModel  articleModel =  ArticleModel(
            title : element["tittle"] ,
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