import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/Models/announcement_model.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/screens/announcment_detail.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    Key? key,
    required this.announcement,
    required this.company,
  }) : super(key: key);
  final AnnouncementModel announcement;
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 175,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // AnnouncementModel announcementModel =
              //     AnnouncementModel(content: 'content');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => AnnouncementDetail(
                            announcement: announcement,
                            company: company,
                          ))));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: (announcement.images[0] != "")
                        ? Container(
                            height: 135,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(announcement.images[0]))),
                          )
                        : Container(
                            height: 135,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'asset/default avatar.jpg'))),
                          ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.pink,
                      margin: EdgeInsets.all(5),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            announcement.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Text(
                              announcement.publishDate,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            // height: 90,
                            child: Text(
                              announcement.content,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(109, 33, 149, 243),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(announcement.companyID,
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
