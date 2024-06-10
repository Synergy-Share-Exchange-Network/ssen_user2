import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/firebase_company_service_method.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/utils.dart';

import '../Models/announcement_model.dart';

class AnnouncementDetail extends StatelessWidget {
  const AnnouncementDetail(
      {Key? key, required this.announcement, required this.company})
      : super(key: key);
  final AnnouncementModel announcement;
  final CompanyProfileModel company;
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
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
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color.fromARGB(17, 0, 0, 0),
                                width: 1),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: InkWell(
                            // onTap: () =>
                            //     Navigator.pushNamed(context, ChannelShop.route),
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(company
                                                .logoImage.isNotEmpty
                                            ? company.logoImage[0]
                                            : 'https://via.placeholder.com/45'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          company.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          company.lineOfBusiness ??
                                              'No description available',
                                          style: const TextStyle(
                                            color: Color.fromARGB(120, 0, 0, 0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  (!company.subscribersID
                                          .contains(user.identification))
                                      ? Container(
                                          width: 150,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.blueAccent,
                                            ),
                                            onPressed: () async {
                                              await FirebaseCompanyServiceMethod()
                                                  .subscribeUser(company, user);
                                              await Provider.of<UserProvider>(
                                                      context,
                                                      listen: false)
                                                  .refreshUser();
                                            },
                                            child: const Text(
                                              "Subscribe",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 150,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.blueAccent,
                                            ),
                                            onPressed: () async {
                                              await FirebaseCompanyServiceMethod()
                                                  .unSubscribeUser(
                                                      company, user);
                                              await Provider.of<UserProvider>(
                                                      context,
                                                      listen: false)
                                                  .refreshUser();
                                            },
                                            child: const Text(
                                              "UnSubscribe",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(17, 0, 0, 0), width: 1),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: InkWell(
                        // onTap: () =>
                        //     Navigator.pushNamed(context, ChannelShop.route),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        company.logoImage.isNotEmpty
                                            ? company.logoImage[0]
                                            : 'https://via.placeholder.com/45'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      company.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      company.lineOfBusiness ??
                                          'No description available',
                                      style: const TextStyle(
                                        color: Color.fromARGB(120, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              (!company.subscribersID
                                      .contains(user.identification))
                                  ? Container(
                                      width: 150,
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueAccent,
                                        ),
                                        onPressed: () async {
                                          await FirebaseCompanyServiceMethod()
                                              .subscribeUser(company, user);
                                          await Provider.of<UserProvider>(
                                                  context,
                                                  listen: false)
                                              .refreshUser();
                                        },
                                        child: const Text(
                                          "Subscribe",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 150,
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blueAccent,
                                        ),
                                        onPressed: () async {
                                          await FirebaseCompanyServiceMethod()
                                              .unSubscribeUser(company, user);
                                          await Provider.of<UserProvider>(
                                                  context,
                                                  listen: false)
                                              .refreshUser();
                                        },
                                        child: const Text(
                                          "UnSubscribe",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
