import 'package:ecommerce/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          
          Lottie.asset("assets/cart.json"),
          //logo
         //Icon(
         // Icons.shopping_bag,
          //size: 72,
          //color: Theme.of(context).colorScheme.inversePrimary,
          //),
           
          //title
          Text(
            "Lovable Loot",
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ) ,
            ),

          const SizedBox(height: 10,),
          //subtitle
          Text(
            "Premium Quality Products",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(height: 25,),
          //button
          MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page') ,
           child: const Icon(Icons.arrow_forward),
           ),
        ],
      ),
      ),
      );
  }
}