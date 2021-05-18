import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/custam_list_tile.dart';
import 'package:test1/util/product_card_util.dart';
import 'package:test1/widget/product_card.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: new ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network("https://www.imgonline.com.ua/examples/rays-of-light-in-the-sky.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name',
                      ),
                      Text(
                        'Email',
                      ),
                      Text(
                        'Phone',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomListTile(
              leading: Icon(CupertinoIcons.house_fill),
              title: 'Home',
              onPressed: () {},
            ),
            CustomListTile(
              leading: Icon(CupertinoIcons.tags_solid),
              title: 'Categories',
              onPressed: () {},
            ),
            CustomListTile(
              leading: Icon(
                CupertinoIcons.heart_solid,
                color: Colors.red,
              ),
              title: 'Wish List',
              onPressed: () {},
            ),
            CustomListTile(
              leading: Icon(CupertinoIcons.slider_horizontal_3),
              title: 'All Product',
              onPressed: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => AllProductPage()));
              },
            ),
            CustomListTile(
              leading: Icon(CupertinoIcons.bag_fill),
              title: 'Order',
              onPressed: () {},
            ),
            CustomListTile(
              leading: Icon(CupertinoIcons.doc),
              title: 'Privacy policy',
              onPressed: () {},
            ),
            CustomListTile(
              leading: Icon(CupertinoIcons.info_circle_fill),
              title: 'About Us',
              onPressed: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Vishwash'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: size.height * .22,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductCard(ProductCardUtil.list[index]);
                },
                itemCount: ProductCardUtil.list.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: size.height * .22,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductCard(ProductCardUtil.list[index]);
                },
                itemCount: ProductCardUtil.list.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: size.height * .22,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductCard(ProductCardUtil.list[index]);
                },
                itemCount: ProductCardUtil.list.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
