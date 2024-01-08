import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';


class Shop extends ChangeNotifier{

  // product for sale 

final List<Product> _shop = [
  //product 1
  Product(
   name: "Grey jack Iron Man Sunglasses",
   price: 99, 
   description: "UNIQUE FRAME DESIGN",
   imagepath: 'assets/glass.jpg',
   ),
   //product 2
  Product(
   name: "Red Chief",
   price: 2692, 
   description: "Leather casual boots for men",
   imagepath: 'assets/boots.jpg',
   ),
   //product 3
  Product(
   name: "Max",
   price: 259, 
   description: "Men Tshirt",
   imagepath: 'assets/tshirt.jpg',
   ),
   //product 4
  Product(
   name: "TIMEWEAR",
   price: 399, 
   description: "Analog Day Date Functioning Stainless Steel Chain Watch for Men",
   imagepath: 'assets/watch.jpg',
   ),

];

  // user cart
List<Product> _cart= [];

  //get product list
List<Product> get shop => _shop;

  //get user cart
List<Product> get cart => _cart;

  //add item to cart 
void addtocart(Product item){
  _cart.add(item);
  notifyListeners();
}

  //remove item from cart
void removefromcart(Product item){
  _cart.remove(item);
  notifyListeners();
}

}