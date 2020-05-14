import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import '../providers/product.dart';
import '../utils/app_routers.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);
        // listen serve para impedir ou habilitar a mudança de estado, foi utilizado false, isso impede a mudança de estado mesmo se tiver um changeNotifier. 
        // foi usado o widget Consumer para permitir a mudança especificamento do icone que era necessário dando assim mais performace, 
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRouters.PRODUCT_DETAIL, arguments: product);
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (ctx) => ProductDetailScreen(product),
            //   ),
            // );
          },
        ), 
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(//!Consumer é considerado um widget e por isso pode ser usado diretamente 
            builder: (ctx, product, _) => IconButton(
              icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toogleFavorite();              
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product);
            },
          ),
        ),
      ),
    );
  }
}
