import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:web_admin_front_end/views/sidebar_screens/categories_screen.dart';
import 'package:web_admin_front_end/views/sidebar_screens/orders_screen.dart';
import 'package:web_admin_front_end/views/sidebar_screens/upload_banner_screen.dart';
import 'package:web_admin_front_end/views/sidebar_screens/vendors_screen.dart';

import 'sidebar_screens/buyers_screen.dart';
import 'sidebar_screens/products_screen.dart';
import 'sidebar_screens/sub_category_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = const VendorsScreen();

  screenSelector(item) {
    switch (item.route) {
      case BuyersScreen.id:
        setState(() {
          _selectedScreen = const BuyersScreen();
        });
        break;

      case VendorsScreen.id:
        setState(() {
          _selectedScreen = const VendorsScreen();
        });
        break;

      case OrdersScreen.id:
        setState(() {
          _selectedScreen = const OrdersScreen();
        });
        break;

      case CategoriesScreen.id:
        setState(() {
          _selectedScreen = const CategoriesScreen();
        });
        break;

      case SubCategoryScreen.id:
        setState(() {
          _selectedScreen = const SubCategoryScreen();
        });
        break;

      case UploadBannerScreen.id:
        setState(() {
          _selectedScreen = const UploadBannerScreen();
        });
        break;

      case ProductsScreen.id:
        setState(() {
          _selectedScreen = const ProductsScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Management'),
      ),
      sideBar: SideBar(
        header: Container(
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          height: 50,
          width: double.infinity,
          child: const Center(
            child: Text(
              'TrendlyBuy Admin',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        items: const [
          AdminMenuItem(
              title: 'Vendors',
              route: VendorsScreen.id,
              icon: CupertinoIcons.person_3),
          AdminMenuItem(
              title: 'Buyers',
              route: BuyersScreen.id,
              icon: CupertinoIcons.person),
          AdminMenuItem(
              title: 'Orders',
              route: OrdersScreen.id,
              icon: CupertinoIcons.purchased_circle),
          AdminMenuItem(
              title: 'Categories',
              route: CategoriesScreen.id,
              icon: CupertinoIcons.list_bullet),
          AdminMenuItem(
              title: 'Sub Categories',
              route: SubCategoryScreen.id,
              icon: CupertinoIcons.list_bullet_below_rectangle),
          AdminMenuItem(
              title: 'Upload Banner',
              route: UploadBannerScreen.id,
              icon: CupertinoIcons.add),
          AdminMenuItem(
              title: 'Products',
              route: ProductsScreen.id,
              icon: CupertinoIcons.shopping_cart),
        ],
        selectedRoute: VendorsScreen.id,
        onSelected: (item) {
          screenSelector(item);
        },
      ),
      body: _selectedScreen,
    );
  }
}
