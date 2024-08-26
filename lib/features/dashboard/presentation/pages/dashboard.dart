import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/dashboard_charts.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/dashboard_navigations.dart';
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
              PaymentOverviewCard(),
              DashboardCharts(),
              _buildPaymentOverviewCards(dimensions),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOverviewCards(AppDimensions dimensions) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: dimensions.isMobile
            ? 1
            : 2, // One column for mobile, two for other screens
        crossAxisSpacing: 16.0, // Spacing between columns
        mainAxisSpacing: 16.0, // Spacing between rows
        childAspectRatio: dimensions.isTablet
            ? 1.3
            : 1.9, // Adjusts the height of the grid cells
      ),
      itemCount: 2, // Number of PaymentOverviewCard widgets
      itemBuilder: (context, index) => PaymentOverviewCard(),
    );
  }
}
