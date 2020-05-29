import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_query/customStockBar.dart';
import 'package:media_query/provider/productState.dart';
import 'package:media_query/provider/stockState.dart';
import 'package:provider/provider.dart';

const Color firstColor = Color(0xFFF44336);
const Color secondColor = Color(0xFF4CAF50);

class ProductCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StockState>(
          create: (context) => StockState(),
        ),
        ChangeNotifierProvider<ProductState>(
            create: (context) => ProductState())
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
          title: Text("Product Card"),
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<StockState>(
                builder: (context, stockState, _) => Consumer<ProductState>(
                  builder: (context, productState, _) => ProductCard(
                    imageUrl:
                        "https://images.unsplash.com/photo-1549007953-2f2dc0b24019?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60",
                    nameProduct: "Buah-buahan 1 kg",
                    price: "Rp. 25.000",
                    onAddCartTap: () {},
                    quantity: productState.quantity,
                    onIncreamentTap: () {
                      productState.quantity++;
                      stockState.stock--;
                    },
                    onDecreamentTap: () {
                      productState.quantity--;
                      stockState.stock++;
                    },
                    notification:
                        (productState.quantity < 5) ? null : "Diskon 10%",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String nameProduct;
  final String price;
  final String notification;
  final int quantity;
  final Function onAddCartTap;
  final Function onIncreamentTap;
  final Function onDecreamentTap;

  final TextStyle textStyle = GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[800]);

  ProductCard(
      {this.imageUrl = "",
      this.nameProduct,
      this.price,
      this.onAddCartTap,
      this.quantity = 0,
      this.notification,
      this.onDecreamentTap,
      this.onIncreamentTap});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // notifikasi
        AnimatedContainer(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 10, right: 10),
          width: 130,
          height: (notification != null) ? 315 : 290,
          duration: Duration(
            milliseconds: 300,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(1, 1),
                    color: Colors.black.withOpacity(0.3))
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: secondColor),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              (notification != null) ? notification : "",
              style: textStyle.copyWith(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        // card
        Container(
          height: 290,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      nameProduct,
                      style: textStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    child: Text(
                      price,
                      style:
                          textStyle.copyWith(fontSize: 12, color: firstColor),
                    ),
                  ),
                  Consumer<StockState>(
                    builder: (context, stockState, _) => CustomStockBar(
                      width: 150,
                      value: stockState.stock,
                      totalValue: 10,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  //tombol +-
                  Container(
                    width: 140,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: firstColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onDecreamentTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: onIncreamentTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: RaisedButton(
                      color: firstColor,
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: onAddCartTap,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        // notifikasi
      ],
    );
  }
}
