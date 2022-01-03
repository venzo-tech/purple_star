import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/Model/product_model.dart';
import 'package:purple_star/screens/cart/cart_checkout_page.dart';
import 'package:purple_star/screens/cart/cart_controller.dart';
import 'package:purple_star/widgets/app_bar_widget.dart';
import 'package:purple_star/widgets/back_button.dart';

class ProductDetailPage extends StatefulWidget {

  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {

    int quantity=1;

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                const CustomBackButton(),
                SizedBox(
                     height: 350.0,
                     child: Image(
                       image: NetworkImage(widget.product.productImageUrl,),
                       fit: BoxFit.cover,
                     ),
                   ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${widget.product.title} - ${widget.product.made}', style:const TextStyle(fontFamily: 'BebasNeue', fontSize: 23),),
                    Container(
                      color: const Color(0xFF297703),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Text(
                          (widget.product.strains).toUpperCase(), style:const TextStyle(fontSize: 13, color: Colors.white, fontFamily: 'Poppins'),),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text('Product Description', style: TextStyle(fontFamily: 'Poppins', fontSize: 13),),
                const SizedBox(height: 30,),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const<Widget> [
                        Text('flavor', style:TextStyle(fontFamily:'BebasNeue', fontSize: 12 ),),
                        Text('quantity', style: TextStyle(fontFamily:'BebasNeue', fontSize: 12 ),),
                        Text('sub total', style: TextStyle(fontFamily:'BebasNeue', fontSize: 12 ),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget> [
                        Text((widget.product.productType.type1), style:const TextStyle(fontFamily:'Poppins', fontSize: 14 ),),
                        Container(
                          height: 40,
                          decoration: const ShapeDecoration(
                            color: Color(0xffe7e7e7),
                            shape: StadiumBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                            child: Row(
                              children: [
                                Text(quantity.toString()),
                                const SizedBox(width: 50,),

                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      quantity = quantity -1 ;
                                    });
                                    print(quantity);
                                  },
                                    child: Icon(Icons.remove, size: 20,)),

                                // IconButton(onPressed: (){
                                //   setState(() {
                                //     quantity--;
                                //   });
                                // },
                                //     icon:const Icon(Icons.remove)),
                                const SizedBox(width: 20,),
                                InkWell(
                                  onTap: (){
                                    cartController.addProduct(widget.product);
                                  },
                                    child: Icon(Icons.add,size: 20,)),
                              ],
                            ),
                          ),),
                        const Text('Total Value'),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                        child: const Text('Proceed to checkout',
                            style:
                            TextStyle(fontFamily: 'BebasNeue', fontSize: 17)),
                        onPressed: () {
                          Get.to(() => const CheckoutScreen());
                        },
                      ),
                    ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //
                //   ],
                // ),
              ],
            ),
          ],),
        ),
      )
    ),);
  }
}
