import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/widget/share_widget.dart';

import '../../utils/helper_function.dart';

class Public extends StatelessWidget {
  const Public({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    ScrollController publicScrollController = ScrollController();

    return Scaffold(
      body: SingleChildScrollView(
        controller: publicScrollController,
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Column(
            children: [
              // ShareWidget(company: null, share: null,),
              // ShareWidget(),
              // ShareWidget(),
              // ShareWidget(),
              // ShareWidget(),
              // ShareWidget(),
              // ShareWidget(),
              // ShareWidget(),
              // ShareWidget(),
              // ShareWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
