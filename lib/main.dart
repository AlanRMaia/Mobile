import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/orders_screen.dart';
import 'package:shop/views/products_overview_screen.dart';
import './utils/app_routers.dart';
import './views/products_detail_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MultiProvider(
      providers: [
        new ChangeNotifierProvider(
          create: (ctx) => new Products(),
        ),
        new ChangeNotifierProvider(
          create: (ctx) => new Cart(),
        ),
        new ChangeNotifierProvider(
          create: (ctx) => new Orders(),
        )
      ],
      child: new MaterialApp(
        title: 'Minha Loja',
        theme: new ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: new ProductsOverviewScreen(),
        routes: {
          AppRouters.PRODUCT_DETAIL: (ctx) => new ProductDetailScreen(),
          AppRouters.CART: (ctx) => new CartScreen(),
          AppRouters.ORDERS: (ctx) => new OrdersScreen(),
        },
      ),
    );
  }
}
