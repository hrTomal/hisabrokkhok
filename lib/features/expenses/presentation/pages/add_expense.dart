import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/core/utils/validation_utils.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:business_tracker/features/common/presentation/widgets/CustomRadioButton/custom_radio_button_row.dart';
import 'package:business_tracker/features/common/presentation/widgets/InputFields/common_text_input_field.dart';
import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_save_floatingaction_button.dart';
import 'package:business_tracker/features/common/presentation/widgets/dropdown/custom_dropdown_search.dart';
import 'package:business_tracker/features/common/presentation/widgets/misc/fixed_sized_box.dart';
import 'package:business_tracker/features/common/presentation/widgets/snackbar/custom_error_snack_bar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  static const String routeName = 'addExpensesPage';
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddExpense> {
  bool _isLoading = false;
  String? _expenseType;
  List<String>? _items;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a delay (e.g., fetching from an API)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _items = ["Food", "Salary", "Rent", "Electricity Bill", "Gas Bill"];
      _isLoading = false;
    });
  }

  var _paymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    final controllers = _initControllers();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Expenses',
      ),
      floatingActionButton: CustomSaveFloatingActionButton(
        onPressed: () => _onSavePressed(context, controllers),
      ),
      body: Padding(
        padding: dimensions.pagePaddingGlobal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomDropdownSearch(
              items: [
                'Option 1',
                'Option 2',
                'Option 3',
                'Option 4',
                'Option 5',
                'Option 6'
              ],
              labelText: 'Select Expense Type',
              createNewText: 'Create new Expense Type',
              onChanged: (value) {
                print('Selected: $value');
              },
              itemAsString: (item) => item,
              onCreateNew: () {
                // Navigator.of(context).pushNamed(AddCategories.routeName);
              },
            ),
            const FixedSizedBox(),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: dimensions.screenWidth * 0.55,
                    child: DropdownSearch<String>(
                      popupProps: const PopupProps.menu(
                        showSearchBox: true,
                      ),
                      items: _items ?? [], // The items list
                      asyncItems: (String filter) async {
                        // Simulate a delay for loading items (e.g., fetching from API)
                        await Future.delayed(Duration(seconds: 2));
                        return [
                          "Food",
                          "Salary",
                          "Rent",
                          "Electricity Bill",
                          "Gas Bill"
                        ];
                      },
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Expense Type",
                          // hintText: "Select Expense Type",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        // Handle the change here
                        print("Selected: $value");
                        _expenseType = value!;
                      },
                      // selectedItem: "India",
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text(
                        'Add Expense Type',
                        // style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['amount']!,
              labelText: 'Amount',
              isNumberOnly: true,
            ),
            const FixedSizedBox(),
            CustomTextField(
              controller: controllers['description']!,
              labelText: 'Description',
            ),
            const FixedSizedBox(),
            Row(
              children: [
                Text(
                  'Payment Method',
                  // style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomRadioButtonRow<String>(
                  options: const ['Cash', 'Bank'],
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      _paymentMethod = value!;
                    });
                  },
                  width: dimensions.screenWidth * 0.60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Initialize TextEditingControllers
  Map<String, TextEditingController> _initControllers() {
    return {
      'amount': TextEditingController(),
      'description': TextEditingController(),
    };
  }

  // Handle save button press
  void _onSavePressed(
      BuildContext context, Map<String, TextEditingController> controllers) {
    final errors = ValidationUtils.validateTextFields(
      [
        {
          'controller': controllers['amount']!,
          'errorMessage': 'Amount is required',
        },
        {
          'controller': controllers['description']!,
          'errorMessage': 'Description is required',
        },
      ],
    );

    if (errors.isNotEmpty) {
      showErrorSnackbar(context: context, errors: errors);
    } else {
      // Handle successful save logic here
    }
  }
}
