import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/dashboard_charts.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/dashboard_navigations.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/main_body/inventory_overview_card.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/main_body/payment_overview_card.dart';
import 'package:business_tracker/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import '../../../common/presentation/widgets/CustomAppBar/custom_app_bar.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = 'dashboard_page';

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: Column(
            children: [
              // InventoryOverviewCard(),
              //_buildResponsiveInventoryCards(),
              // DashboardCharts(),
              // _buildTopOfDashboardCards(dimensions),
              DashboardNavigationsWidget(),
              //_buildPaymentOverviewCards(dimensions),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOverviewCards(AppDimensions dimensions) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: dimensions.isMobile
            ? 1
            : 2, // One column for mobile, two for other screens
        crossAxisSpacing: 16.0, // Spacing between columns
        mainAxisSpacing: 16.0, // Spacing between rows
        childAspectRatio: dimensions.isTablet
            ? 1.3
            : 1.8, // Adjusts the height of the grid cells
      ),
      itemCount: 1, // Number of PaymentOverviewCard widgets
      itemBuilder: (context, index) => PaymentOverviewCard(),
    );
  }

  Widget _buildResponsiveInventoryCards() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the number of columns based on screen width
        double screenWidth = constraints.maxWidth;
        int crossAxisCount;

        if (screenWidth < 600) {
          // Mobile
          crossAxisCount = 1;
        } else if (screenWidth < 1200) {
          // Tablet
          crossAxisCount = 2;
        } else {
          // Web or larger screens
          crossAxisCount = 3;
        }

        // Calculate the width for each item
        double itemWidth =
            (screenWidth - 16 * (crossAxisCount - 1)) / crossAxisCount;

        return Wrap(
          spacing: 16.0, // Horizontal spacing between cards
          runSpacing: 16.0, // Vertical spacing between cards
          children: List.generate(
            2, // Number of InventoryOverviewCard widgets
            (index) => SizedBox(
              width: itemWidth,
              child: const InventoryOverviewCard(),
            ),
          ),
        );
      },
    );
  }
}
