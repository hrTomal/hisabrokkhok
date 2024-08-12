import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:flutter/material.dart';

class GenericDashboardCard extends StatelessWidget {
  final String title;
  final Widget? dropdown;
  final List<Widget> gridItems;

  const GenericDashboardCard({
    Key? key,
    required this.title,
    this.dropdown,
    required this.gridItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    return Card(
      color: Theme.of(context).colorScheme.surfaceBright,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: dimensions.pagePaddingGlobal,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (dropdown != null) dropdown!,
              ],
            ),
            const SizedBox(height: 5),
            GridView.count(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
              shrinkWrap: true,
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 3, // Adjust as needed
              children: gridItems,
            ),
          ],
        ),
      ),
    );
  }
}
