import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/main_dashboard_body.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import '../../../common/presentation/widgets/InputFields/common_text_input_field.dart';
import '../../../common/presentation/widgets/InputFields/generic_dropdown.dart';
import '../widgets/sliding_up_panel.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = 'dashboard_page';

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    var slidingPanelTopRadius = dimensions.screenWidth * .040;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dashboard',
      ),
      body: GestureDetector(
        onTap: () {
          if (_panelController.isPanelOpen) {
            _panelController.close();
          }
        },
        child: Padding(
          padding: dimensions.pagePaddingGlobal,
          child: Stack(
            children: [
              MainDashboardBody(),
              SlidingUpPanel(
                controller: _panelController,
                // header: const Text('Menu'),
                maxHeight: dimensions.screenHeight * 0.75,
                minHeight: dimensions.screenHeight * 0.10,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(slidingPanelTopRadius),
                  topRight: Radius.circular(slidingPanelTopRadius),
                ),
                panel: SlidingUpPanelWidget(),
                body:
                    const SizedBox.shrink(), // An empty widget behind the panel
              ),
            ],
          ),
        ),
      ),
    );
  }
}
