import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_tile_button.dart';
import 'package:business_tracker/features/products/presentation/pages/all_products.dart';
import 'package:business_tracker/features/sales/presentation/pages/add_sale.dart';
import 'package:flutter/material.dart';

class DashboardNavigationsWidget extends StatelessWidget {
  DashboardNavigationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);

    final List<Map<String, dynamic>> tiles = [
      {
        'icon': Icons.shopping_cart,
        'text': 'New Sale',
        'onPressed': () {
          Navigator.of(context).pushNamed(AddSale.routeName);
        }
      },
      {'icon': Icons.add_box, 'text': 'Purchase', 'onPressed': () {}},
      {
        'icon': Icons.playlist_add,
        'text': 'Products',
        'onPressed': () {
          Navigator.of(context).pushNamed(AllProducts.routeName);
        }
      },
      {'icon': Icons.undo, 'text': 'Returns', 'onPressed': () {}},
      {'icon': Icons.home_filled, 'text': 'Warehouses', 'onPressed': () {}},
      // {'icon': Icons.man_3, 'text': 'Investors', 'onPressed': () {}},
      {'icon': Icons.man, 'text': 'Customers', 'onPressed': () {}},
      {'icon': Icons.money_rounded, 'text': 'Transactions', 'onPressed': () {}},
      // {'icon': Icons.attach_money, 'text': 'Pay/Get cash', 'onPressed': () {}},
      {'icon': Icons.document_scanner, 'text': 'Reports', 'onPressed': () {}},
      {'icon': Icons.wallet, 'text': 'Expenses', 'onPressed': () {}},
      {'icon': Icons.more_horiz, 'text': 'More', 'onPressed': () {}},
    ];

    var crossAxisTileCount = 5;
    if (dimensions.isMobile) {
      crossAxisTileCount = 5;
    } else if (dimensions.isTablet) {
      crossAxisTileCount = 7;
    } else {
      crossAxisTileCount = 9;
    }

    return Container(
      padding: dimensions.pagePaddingGlobal,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: tiles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisTileCount, // Number of tiles in a row
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 1, // Adjust the height/width ratio of the tiles
        ),
        itemBuilder: (context, index) {
          return CustomTileButton(
            icon: tiles[index]['icon'],
            text: tiles[index]['text'],
            onPressed: tiles[index]['onPressed'],
          );
        },
      ),
    );
  }
}
