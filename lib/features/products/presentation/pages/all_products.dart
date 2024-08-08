import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  static const String routeName = 'all_products_page';
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var pageHeight = MediaQuery.of(context).size.height;
    var pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Products',
      ),
      body: SingleChildScrollView(
        child: Text(
          pageHeight.toString(),
        ),
      ),
    );
  }
}
