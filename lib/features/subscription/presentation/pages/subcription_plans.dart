import 'package:business_tracker/features/common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SubcriptionPlansPage extends StatelessWidget {
  static const String routeName = 'subcription_plans_page';
  const SubcriptionPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Subscription Plans'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Gradient Card
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Card(
                  color: Colors
                      .transparent, // To make sure the gradient is visible
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Prime Strategy',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // buildSingleColorCard(Colors.grey.shade200, 'Success Engine'),
              // const SizedBox(height: 10),
              // buildSingleColorCard(Colors.blueGrey.shade100, 'Growth Boost'),
              // const SizedBox(height: 10),
              // buildSingleColorCard(Colors.green.shade100, 'Starter Path'),
              // const SizedBox(height: 10),
              // buildSingleColorCard(Colors.orange.shade100, 'Custom'),
              // const SizedBox(height: 10),
              buildClickableCard(
                context,
                color: Colors.grey.shade200,
                planName: 'Success Engine',
                price: '550',
                validity: '6',
                // discount: '50',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              buildClickableCard(
                context,
                color: Colors.blueGrey.shade100,
                planName: 'Growth Boost',
                price: '280',
                validity: '3',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              buildClickableCard(
                context,
                color: Colors.green.shade100,
                planName: 'Starter Path',
                price: '100',
                validity: '1',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              buildClickableCard(
                context,
                color: Colors.orange.shade100,
                planName: 'Custom',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to generate a single-color card
  Widget buildSingleColorCard(Color color, String planName) {
    return Card(
      color: color,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          planName,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }

  Widget buildClickableCard(
    BuildContext context, {
    LinearGradient? gradient,
    Color? color,
    String? price,
    String? validity,
    String? discount,
    required String planName,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color, // To make sure the gradient or color is visible
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    planName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (price != null &&
                      validity != null) // Check if price is not null
                    Text(
                      '৳ $price - $validity months',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                ],
              ),
              if (discount != null) Text('Saved ৳ : $discount')
            ],
          ),
        ),
      ),
    );
  }
}
