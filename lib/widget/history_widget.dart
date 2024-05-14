import 'package:flutter/material.dart';
import 'package:ssen_user/Models/history_model.dart';
import 'package:ssen_user/screens/history_detail.dart';
import 'package:ssen_user/utils/constants/custom_text_style.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
    required this.history,
  }) : super(key: key);
  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => HistoryDetail())));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 200,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(13, 29, 29, 29),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history.title,
                    style: CustomTextStyle.titleBold,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(history.description,
                        style: Theme.of(context).textTheme.bodyMedium

                        // overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "view more",
                        style: TextStyle(color: Colors.blue, fontSize: 13),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
