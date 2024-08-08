import 'package:business_tracker/features/common/presentation/widgets/CustomRadioButton/custom_radio_button_row.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/generic_dropdown.dart';
import 'package:flutter/material.dart';

class MainDashboardBody extends StatefulWidget {
  const MainDashboardBody({super.key});

  @override
  State<MainDashboardBody> createState() => _MainDashboardBodyState();
}

class _MainDashboardBodyState extends State<MainDashboardBody> {
  List<String> list = <String>['Option 1', 'Option 2', 'Option 3'];
  String _dropdownValue = 'Option 1';
  final TextEditingController _textController = TextEditingController();
  String _radioValue = 'Option A';

  @override
  Widget build(BuildContext context) {
    return Column(
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
        CustomRadioButtonRow<String>(
          options: ['Product', 'Service', 'Recipe'],
          groupValue: _radioValue,
          onChanged: (value) {
            setState(() {
              _radioValue = value!;
            });
          },
        ),
      ],
    );
  }
}
