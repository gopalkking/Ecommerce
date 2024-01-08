import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove the item from cart
  void removeItemFromCart(BuildContext context, Product product){
    //show dialog remove 
     showDialog(
   context: context, 
   builder: (context) => AlertDialog(
   content: const Text("Remove this item from your cart?"),
   actions: [
    //cancel
    MaterialButton(
      onPressed: () => Navigator.pop(context),
       child: const Text("cancel"),
    ),

    //yes button 
    MaterialButton(
      onPressed: () {
     //pop dialog box
     Navigator.pop(context);

     //add to shop
     context.read<Shop>().removefromcart(product);

      },
       child:  Text("Yes"),
    ),
   ],
  ),
  );
  }

  // user pressed pay button 
  void payButtonPressed(BuildContext context)
{
  showDialog(context: context, 
  builder: (context) => AlertDialog(
    content: Text("user wants to pay connect this app to your payment backend"),
  ));
}
  @override
  Widget build(BuildContext context) {
    //get access the cart 
    final cart = context.watch<Shop>().cart;  

     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty ? const Center(child: Text("Your cart is empty..")) 
            : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
              //get invidual item in cart
             final item = cart[index];

              //return as cart title UI
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => removeItemFromCart(context, item),
                ),
              );
            },
            ),
            ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: () => payButtonPressed(context), child: Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}