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
  List<String> list = <String>['Option 1', 'Option 2', 'Option 3'];
  String _dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    var slidingPanelTopRadius = deviceWidth * .040;
    final TextEditingController _textController = TextEditingController();

    String _radioValue = 'Option A';
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
        child: Stack(
          children: [
            // const Center(
            //   child: Text("This is the Widget behind the sliding panel"),
            // ),
            Column(
              children: [
                CustomTextField(
                  controller: _textController,
                  labelText: 'Enter Text',
                ),
                const SizedBox(height: 20.0),
                GenericDropdownButton<String>(
                  items: ['Option 1', 'Option 2', 'Option 3'],
                  value: _dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      _dropdownValue = value!;
                    });
                  },
                  hint: 'Select an option',
                ),
                // DropdownButton<String>(
                //   value: _dropdownValue,
                //   icon: const Icon(Icons.arrow_downward),
                //   elevation: 16,
                //   style: const TextStyle(color: Colors.deepPurple),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String? value) {
                //     // This is called when the user selects an item.
                //     print("value updated: $value");
                //     setState(() {
                //       _dropdownValue = value!;
                //       print("State updated: $_dropdownValue");
                //     });
                //   },
                //   items: list.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                // ),
              ],
            ),

            SlidingUpPanel(
              controller: _panelController,
              header: const Text('Menu'),
              maxHeight: deviceHeight * 0.75,
              minHeight: deviceHeight * 0.50,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(slidingPanelTopRadius),
                topRight: Radius.circular(slidingPanelTopRadius),
              ),
              panel: SlidingUpPanelWidget(),
              body: const SizedBox.shrink(), // An empty widget behind the panel
            ),
          ],
        ),
      ),
    );
  }
}
