import 'package:business_tracker/features/products/presentation/pages/all_products.dart';
import 'package:business_tracker/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/buttons/custom_tile_button.dart';

class SlidingUpPanelWidget extends StatelessWidget {
  SlidingUpPanelWidget({super.key});

  void _navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, SettingsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tiles = [
      {
        'icon': Icons.inventory,
        'text': 'Products',
        'onPressed': () {
          Navigator.of(context).pushNamed(AllProducts.routeName);
        }
      },
      {
        'icon': Icons.settings,
        'text': 'Settings',
        'onPressed': () => Navigator.pushNamed(
              context,
              SettingsPage.routeName,
            )
      },
      {'icon': Icons.shopping_bag, 'text': 'Sales', 'onPressed': () {}},
      {'icon': Icons.add_box, 'text': 'Purchase', 'onPressed': () {}},
      {'icon': Icons.playlist_add, 'text': 'P.Order', 'onPressed': () {}},
      {'icon': Icons.undo, 'text': 'Customer return', 'onPressed': () {}},
      {'icon': Icons.replay, 'text': 'Return purchase', 'onPressed': () {}},
      {'icon': Icons.attach_money, 'text': 'Pay/Get cash', 'onPressed': () {}},
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: tiles.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of tiles in a row
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
