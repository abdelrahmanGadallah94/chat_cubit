import 'package:flutter/material.dart';
import '../../settings/app_strings.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              AppString.homeText1,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text(AppString.homeText2, style: TextStyle(fontSize: 22)),
          ],
        ));
  }
}
