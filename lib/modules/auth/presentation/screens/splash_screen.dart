import 'package:flutter/material.dart';


import '../../../../core/constants/app_colors.dart';


class SplashScreen extends StatefulWidget {
  /// This screen is fully Responsive
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _afterSplash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // E pay name
                 Text(
                    "Complaint",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColors.white, letterSpacing: 6),
                  ),
                
                const SizedBox(height: 30),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }

  void _afterSplash(BuildContext context) async { 
    await Future.delayed(Duration(seconds: 5));
    if (!context.mounted) return;
    // context.go(HomeRoute.name);
  }
}
