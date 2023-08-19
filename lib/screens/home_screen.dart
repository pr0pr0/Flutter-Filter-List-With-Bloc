import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:travel/widgets/CustomAppBar.dart';
import 'package:travel/widgets/SiderShow.dart';
import 'package:travel/widgets/excel.dart';
import 'package:travel/widgets/groups.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future<void> didChangeDependencies() async {
final locale = await Devicelocale.currentLocale;


String language = '';
String country = '';

if (locale != null && locale.length >= 2) {
  try {
    language = locale.substring(0, 2);
    
  } catch (e) {
    debugPrint('Error when fetching user language: $e');
  }
}

String mo = locale!.toString();
   debugPrint('mo: $mo');

if (locale != null && locale.length >= 5) {
  try {
    country = locale.substring(3, 5);
  } catch (e) {
    debugPrint('Error when fetching user country: $e');
  }
}

debugPrint('Language: $language');
debugPrint('Country: $country');

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfff8f9ff),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar('تطبيق', false),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SiderShow(),
                      SizedBox(
                        height: 10,
                      ),
                      excel(),
                      SizedBox(
                        height: 10,
                      ),
                      groups(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
