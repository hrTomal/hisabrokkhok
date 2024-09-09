import 'package:business_tracker/features/common/presentation/widgets/buttons/custom_buttons.dart';
import 'package:business_tracker/features/dashboard/presentation/pages/dashboard.dart';
import 'package:business_tracker/features/subscription/presentation/pages/subcription_plans.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  static const String routeName = 'authentication_page';
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an Account?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email/Phone',
                  // hintText: 'example@email.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  // hintText: '**************',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
              CustomButtonPrimary(
                text: 'Navigate',
                onPressed: () {
                  Navigator.of(context).pushNamed(Dashboard.routeName);
                },
              ),
              CustomButtonPrimary(
                text: 'Plans',
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(SubcriptionPlansPage.routeName);
                },
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).indicatorColor,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                child: const Text('New user? Register Now'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
