import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newws/Views/article_view.dart';
import 'home.dart';
import 'tiles.dart';
import 'category_news.dart';

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
