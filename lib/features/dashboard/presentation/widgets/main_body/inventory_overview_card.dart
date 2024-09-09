import 'package:business_tracker/features/dashboard/presentation/widgets/main_body/generic_dashboard_card.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/main_body/inner_generic_card.dart';
import 'package:flutter/material.dart';

class InventoryOverviewCard extends StatelessWidget {
  const InventoryOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const GenericDashboardCard(
      title: 'Inventory Overview',
      gridItems: [
        InnerGenericCard(
          label: 'Total Inventory',
          value: '0.00',
          icon: Icons.arrow_downward,
        ),
        InnerGenericCard(
          label: 'Total Receivable',
          value: '0.00',
          icon: Icons.arrow_downward,
        ),
      ],
    );
  }
}
