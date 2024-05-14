import 'package:flutter/material.dart';

class SettingElementsWidget extends StatelessWidget {
  const SettingElementsWidget({
    Key? key,
    required this.name,
    required this.description,
    required this.icon,
    required this.onpress,

    // required this.function,
  }) : super(key: key);
  final String name;
  final String description;
  final IconData icon;
  final VoidCallback onpress;
  // final Function function;
  // final VoidCallback function2;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        // color: Color.fromARGB(70, 255, 255, 255),
        decoration: BoxDecoration(
            color: Color.fromARGB(13, 158, 158, 158),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 140,
                  child: Text(
                    description,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
