import 'package:flutter/material.dart';
import 'package:test1/model/product_card_model.dart';

class ProductCard extends StatelessWidget {
  ProductCardModel productCardModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Container(
        height: size.width*.35,
        width: size.width*.35,
        child: Column(
          children: [
            Expanded(flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: size.width*.45,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(
                    "${productCardModel.image}",
                    width: size.width,
                    //  height: size.height*.03,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(flex: 1,
              child: Container( width: size.width*.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${productCardModel.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rs: ${productCardModel.rate}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ProductCard(this.productCardModel);
}
