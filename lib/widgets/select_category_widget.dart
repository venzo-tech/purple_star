import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/accessories.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/concentrates.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/edibles.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/flowers.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/prerolls.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/sales.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/tinctures.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/topicals.dart';
import 'package:purple_star/screens/Drawer%20Menu/shop/vape_pens.dart';

class CategoryModel {
  const CategoryModel({required this.title, required this.image});
  final String title;
  final String image;
}

const List<CategoryModel> category = <CategoryModel>[
  CategoryModel(
      title: 'Concentrates', image: 'assets/image/cate-concentrates.jpeg'),
  CategoryModel(title: 'Edibles', image: 'assets/image/cate-edibles.jpeg'),
  CategoryModel(title: 'Flowers', image: 'assets/image/cate-flowers.jpeg'),
  CategoryModel(title: 'Prerolls', image: 'assets/image/cate-prerolls.jpeg'),
  CategoryModel(title: 'Tinctures', image: 'assets/image/cate-tinctures.jpeg'),
  CategoryModel(title: 'Topicals', image: 'assets/image/cate-topicals.jpeg'),
  CategoryModel(title: 'Vape Pens', image: 'assets/image/cate-vape_pens.jpeg'),
  CategoryModel(
      title: 'Accessories', image: 'assets/image/cate-accessories.jpeg'),
  CategoryModel(title: 'Concentrates', image: 'assets/image/cate-sale.jpeg'),
];

class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key, required this.categoryModel})
      : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    // print(item);
                    if(categoryModel.title == 'Concentrates'){
                      Get.to(() => Concentrates(pageTitle: categoryModel.title));
                    }else if(categoryModel.title == 'Edibles'){
                      Get.to(() => Edibles(pageTitle: categoryModel.title));
                    }else if(categoryModel.title == 'Flowers'){
                      Get.to(() => Flowers(pageTitle: categoryModel.title));
                    }else if(categoryModel.title == 'Prerolls'){
                      Get.to(() => Prerolls(pageTitle: categoryModel.title));
                    }else if(categoryModel.title == 'Tinctures'){
                      Get.to(() => Tinctures(pageTitle: categoryModel.title));
                    }else if(categoryModel.title == 'Topicals'){
                      Get.to(() => Topicals(pageTitle: categoryModel.title));
                    }else if(categoryModel.title == 'Vape Pens'){
                      Get.to(() => VapePens(pageTitle: categoryModel.title));
                    }else if(categoryModel.title == 'Accessories') {
                      Get.to(() => Accessories(pageTitle: categoryModel.title));
                    } else  if(categoryModel.title == 'Sales') {
                      Get.to(() => Sales(pageTitle: categoryModel.title));
                    }
                  },
                  child: Container(
                    decoration:const
                    BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 7.0,
                              offset: Offset(0.0, 0.75)
                          )
                        ],
                    ),

                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(categoryModel.image),
                      // backgroundImage: NetworkImage(categoryModel.image),
                    ),
                  ),
                ),
               const SizedBox(height: 10,),
                Text(categoryModel.title,
                    style:
                        const TextStyle(fontFamily: 'Poppins', fontSize: 15, fontWeight: FontWeight.w500)),
              ]),
        );
  }
}
