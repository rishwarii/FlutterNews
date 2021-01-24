import 'package:flutter_newws/helper/news.dart';
import 'package:flutter_newws/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_newws/helper/data.dart';
import 'package:flutter_newws/models/category_model.dart';
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
            Text("Flutter") ,
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


      ) : Container(
        child: Column(
          children: <Widget>[
            Container( ///categories
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 100,
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
            //////
            //
            //

            Container(
              child: ListView.builder(
                  itemCount: articles.length , shrinkWrap: true,
                itemBuilder: (context , index ){

                return BlockTile(
                  imgUrl: articles[index].urlToimg,
                  title:  articles[index].title,
                  description: articles[index].description,
                ) ;
              },),
            )
          ],
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

      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget> [
            ClipRRect( borderRadius: BorderRadius.circular(9),
                child: Image.network(imageURL , width: 190 , height: 95 , fit: BoxFit.cover,),
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



class BlockTile extends StatelessWidget {
  final String imgUrl  ,  title,   description;

  const BlockTile({ @required this.imgUrl, @required this.title,@required this.description}) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imgUrl) ,
          Text(title) ,
          Text(description)
        ],
      ),
    );
  }
}
