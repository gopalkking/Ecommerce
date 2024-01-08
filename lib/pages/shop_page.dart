import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {  

  // access product in shop 
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Lovable Loot"),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/cart_page'),
           icon: Icon(Icons.shopping_cart_outlined))
        ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            const SizedBox(height: 25,),
            //shop title
             Center(
              child: Text("Pick from a selected list of premium products",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
              ),
              ),

            //shop subtitle


            //product list 
            SizedBox(
          height: 550,
          child: ListView.builder(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context,index){
                 //get each invidual of the product 
           final product = products[index];
          
                 //return as a product 
                 return MyProductTile(product: product);
            },
          ),
        ),
          ],
        ),
    );
  }
}