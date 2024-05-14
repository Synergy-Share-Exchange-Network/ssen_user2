import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/Models/faq_model.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/widget/faq_element_widget.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FaqModel faq = FaqModel(
      identification: "778",
      title: "what are the main functions of stock market?",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      date: "",
      companyId: "",
    );
    FaqModel faq2 = FaqModel(
      identification: "778",
      title: "What are stocks, bonds, and other financial instruments?",
      description:
          "Popular investment strategies include buy-and-hold, value investing, growth investing, dividend investing, and index investing. Diversification across different asset classes and industries is crucial for managing risk in a portfolio.",
      date: "",
      companyId: "",
    );
    FaqModel faq3 = FaqModel(
      identification: "778",
      title:
          "What are the risks associated with different investment strategies?",
      description:
          "tock analysis involves examining a company's financial statements, such as its income statement, balance sheet, and cash flow statement, to assess its financial health and growth prospects. Key metrics include earnings per share, price-to-earnings ratio, debt-to-equity ratio, and return on equity.",
      date: "",
      companyId: "",
    );
    FaqModel faq4 = FaqModel(
      identification: "778",
      title: "What are the key metrics to consider when evaluating a stock?",
      description: "",
      date: "",
      companyId: "",
    );
    FaqModel faq5 = FaqModel(
      identification: "778",
      title: "What are the key metrics to consider when evaluating a stock?",
      description:
          "Market trends can be influenced by factors such as economic indicators, corporate earnings reports, geopolitical events, and central bank policies. It's important for investors to stay informed about current events and analyze their potential impact on the stock market.",
      date: "",
      companyId: "",
    );
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
          'FAQ ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: MediaQuery.of(context).size.width > phoneSize
          ? SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width - 1000,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("asset/logo_image/faq.jpg"))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Frequently Asked Questions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          child: Text(
                            "General",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        FaqElementWidget(faq: faq),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     // ignore: prefer_const_literals_to_create_immutables
                        //     children: [
                        //       FaqElementWidget(faq: faq),
                        //       FaqElementWidget(faq: faq2),
                        //       FaqElementWidget(faq: faq3),
                        //       FaqElementWidget(faq: faq4),
                        //       FaqElementWidget(faq: faq5),
                        //       FaqElementWidget(faq: faq),

                        //       // FaqElementWidget(questions: faq.title),
                        //       // FaqElementWidget(
                        //       //     questions: "How does the stock market work?"),
                        //       // const FaqElementWidget(
                        //       //     questions: "What factors can affect stock prices?"),
                        //       // FaqElementWidget(
                        //       //     questions:
                        //       //         "What is the difference between stocks, bonds, and mutual funds?What is the difference between stocks, b"),
                        //       // FaqElementWidget(
                        //       //     questions: "How do you buy and sell stocks?"),
                        //       // FaqElementWidget(
                        //       //     questions:
                        //       //         "what are the main functions of stock market?"),
                        //       // FaqElementWidget(
                        //       //     questions: "How does the stock market work?"),
                        //       // FaqElementWidget(
                        //       //     questions: "What factors can affect stock prices?"),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Container(
                width: 400,
                margin: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Frequently Asked Questions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      child: Text(
                        "General",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          FaqElementWidget(faq: faq),
                          FaqElementWidget(faq: faq2),
                          FaqElementWidget(faq: faq3),
                          FaqElementWidget(faq: faq4),
                          FaqElementWidget(faq: faq5),
                          FaqElementWidget(faq: faq),

                          // FaqElementWidget(questions: faq.title),
                          // FaqElementWidget(
                          //     questions: "How does the stock market work?"),
                          // const FaqElementWidget(
                          //     questions: "What factors can affect stock prices?"),
                          // FaqElementWidget(
                          //     questions:
                          //         "What is the difference between stocks, bonds, and mutual funds?What is the difference between stocks, b"),
                          // FaqElementWidget(
                          //     questions: "How do you buy and sell stocks?"),
                          // FaqElementWidget(
                          //     questions:
                          //         "what are the main functions of stock market?"),
                          // FaqElementWidget(
                          //     questions: "How does the stock market work?"),
                          // FaqElementWidget(
                          //     questions: "What factors can affect stock prices?"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
