import 'package:flutter/material.dart';
import 'package:ssen_user/utils/constants.dart';

class AnnouncementDetail extends StatelessWidget {
  const AnnouncementDetail({Key? key}) : super(key: key);

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
                        const Text(
                          "Dow jones nasdaq s and p 500 weekly preview: january cpi report takes the central stage u.s stock muted ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: const Text(
                            "Dec02/2023,   06:30 AM ",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: const Text(
                            "Posted By Mr. james R. ",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 250,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("asset/logo_image/goat.jpg"))),
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
                          child: const Text(
                            "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                            "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. ",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: const Text(
                            "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                            "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. Major indices such as the S&P 500, Dow Jones Industrial Average, and NASDAQ Composite Index are often used to gauge the overall performance of the stock market.",
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
                    const Text(
                      "Dow jones nasdaq s and p 500 weekly preview: january cpi report takes the central stage u.s stock muted ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: const Text(
                        "Dec02/2023,   06:30 AM ",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: const Text(
                        "Posted By Mr. james R. ",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("asset/logo_image/goat.jpg"))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: const Text(
                        "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                        "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. ",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: const Text(
                        "As of my last update in January 2022, I can't provide real-time information. However, I can give you some general information about the stock market in America up to that point"
                        "The stock market is influenced by various factors, including economic indicators, geopolitical events, company performance, and investor sentiment. Major indices such as the S&P 500, Dow Jones Industrial Average, and NASDAQ Composite Index are often used to gauge the overall performance of the stock market.",
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
