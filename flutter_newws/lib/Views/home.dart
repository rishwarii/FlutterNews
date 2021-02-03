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


class CategoryTile extends StatelessWidget {
  final imageURL  ,categoryname;
  CategoryTile({this.imageURL , this.categoryname}) ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Category_News(
                      category : categoryname.toString().toLowerCase() ,
                    )
                ) );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16 , bottom: 10 , top: 10 ),
        child: Stack(
          children: <Widget> [
            ClipRRect( borderRadius: BorderRadius.circular(9),
                child:
                CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl: imageURL , width: 190 , height: 95 , fit: BoxFit.cover,
                ),
            )  ,
            Container(
              alignment: Alignment.center,
              width: 190 , height: 95 ,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(9),
      color: Colors.black26,

      ) ,
              child: Text(
                categoryname , style: TextStyle(
                fontSize: 20,
                fontWeight:  FontWeight.w800,
                  color: Colors.white
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class BlogTile extends StatelessWidget {
  final String imgUrl  ,  title,   description , url ;

  const BlogTile({ @required this.imgUrl, @required this.title,@required this.description , @required this.url}) ;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(
          blogURL: url,
        ))) ;
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          children:<Widget> [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imgUrl)) ,
            SizedBox(height: 8,),

            Text(title , style: TextStyle(
              fontSize: 17 , color: Colors.black87 , fontWeight: FontWeight.bold ,
            ),) ,
            SizedBox(height: 8,),

            Text(description , textAlign: TextAlign.justify, style: TextStyle(
              color: Colors.grey[600] ,
            ),)
          ],
        ),
      ),
    );
  }
}
