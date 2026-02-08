import 'package:flutter/material.dart';

import 'pages/dashboard_page.dart';
import 'theme/hr_theme.dart';

class HrSuiteApp extends StatelessWidget {
  const HrSuiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HR Management Suite',
      debugShowCheckedModeBanner: false,
      theme: HrTheme.light,
      home: const DashboardPage(),
    );
  }
}
