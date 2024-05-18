import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/widget/share_info_widget.dart';

class Assets extends StatelessWidget {
  const Assets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.blue,
              size: 20,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Assets ',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ShareInfoWidget(),
            // ShareInfoWidget(),
            // ShareInfoWidget(),
            // ShareInfoWidget(),
            // ShareInfoWidget(),
            // ShareInfoWidget(),
            // ShareInfoWidget(),
          ],
        ),
      ),
    );
  }
}
