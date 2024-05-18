import 'package:flutter/material.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/utils.dart';

import '../Models/announcement_model.dart';

class AnnouncementDetail extends StatelessWidget {
  const AnnouncementDetail({Key? key, required this.announcement})
      : super(key: key);
  final AnnouncementModel announcement;
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
          'Announcement Detail',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: (MediaQuery.of(context).size.width > phoneSize)
          ? Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          announcement.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            announcement.publishDate,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: Text(
                            announcement.postedBy,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (announcement.images[0] != "")
                            ? Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            getImage(announcement.images[0])))),
                              )
                            : Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    // border: Border.all(
                                    //     color: Colors.blue, width: 3),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'asset/default avatar.jpg'))),
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Container(
                          child: Text(
                            announcement.content,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcement.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        announcement.publishDate,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: Text(
                        announcement.postedBy,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    (announcement.images[0] != "")
                        ? Container(
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        getImage(announcement.images[0])))),
                          )
                        : Container(
                            height: 250,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'asset/default avatar.jpg'))),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        announcement.content,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
