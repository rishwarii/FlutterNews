import 'package:flutter_newws/models/category_model.dart';


List<Category_Model> getCategory(){

  List<Category_Model> category = new List<Category_Model>() ;
  Category_Model categoryModel =  new Category_Model() ;

  //1
  categoryModel.category_name = "Business" ;
  categoryModel.imgurl = "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" ;

category.add(categoryModel) ;

categoryModel = new Category_Model() ;

//2

categoryModel.category_name = "Entertainment" ;
categoryModel.imgurl = "https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80" ;
category.add(categoryModel) ;
categoryModel = new Category_Model() ;

//3

  categoryModel.category_name = "General" ;
  categoryModel.imgurl = "https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" ;
  category.add(categoryModel) ;
  categoryModel = new Category_Model() ;
  //4


  categoryModel.category_name = "Health" ;
  categoryModel.imgurl = "https://images.unsplash.com/photo-1471864190281-a93a3070b6de?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" ;
  category.add(categoryModel) ;
  categoryModel = new Category_Model() ;

  //5


  categoryModel.category_name = "Science" ;
  categoryModel.imgurl = "https://images.unsplash.com/photo-1576319155264-99536e0be1ee?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=675&q=80" ;
  category.add(categoryModel) ;
  categoryModel = new Category_Model() ;

  //6

  categoryModel.category_name = "Technology" ;
  categoryModel.imgurl = "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" ;
  category.add(categoryModel) ;
  categoryModel = new Category_Model() ;


  //7 maybe

return category ;
}