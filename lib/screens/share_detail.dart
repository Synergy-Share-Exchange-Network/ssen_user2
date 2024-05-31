// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:ssen_user/Models/company_profile_model.dart';

// import '../Models/share_model.dart';
// import '../utils/constants.dart';
// import '../widget/analytics/graph1.dart';
// import '../widget/analytics/graph2.dart';
// import '../widget/share_detail_element_widget.dart';

// class ShareDetail extends StatefulWidget {
//   ShareDetail({super.key, required this.company, required this.share});
//   static const route = "product_detail";
//   final CompanyProfileModel company;
//   final ShareModel share;
//   @override
//   State<ShareDetail> createState() => _ShareDetailState();
// }

// class _ShareDetailState extends State<ShareDetail> {
//   // ShareModel share = ShareModel(
//   //   savingAccountPercentage: 12.5,
//   //   proclamationNumber: "PRO123",
//   //   minimumNumberOfBuyer: 5,
//   //   maximumNumberOfBuyer: 20,
//   //   bankInformation: ['Bank A', 'Bank B', 'Bank C'],
//   //   shareImage: ['asset/logo_image/goat.jpg', 'asset/demo_image/habesha1.jpg'],
//   //   unitSharePrice: 15.75,
//   //   noOfShares: 500,
//   //   divident: 7.2,
//   //   minimumPaymentInPercent: 10.0,
//   //   minimumNumberOfSharesToBuy: 1.0,
//   //   maximumNumberOfSharesToBuy: 50.0,
//   //   requirement: "Valid ID proof required",
//   //   identification: "ABC123",
//   //   companyID: "COMP456",
//   //   description: "Invest in our company shares for great returns!",
//   //   searchKeyWords: ['investment', 'shares', 'dividend'],
//   //   returnDividentDescription: ["Yearly", "Biannually"],
//   //   timeToReturnRemainPayment: 90,
//   //   currency: "USD",
//   //   dateAdded: "2024-05-18",
//   //   isDeleted: false,
//   //   isHidden: false,
//   // );
//   // CompanyProfileModel company = CompanyProfileModel(
//   //   name: 'Habesha Beer',
//   //   businessSector: 'Agriculture',
//   //   lineOfBusiness: 'lineOfBusiness',
//   //   yearOfEstablishment: '2001',
//   //   email: 'habeshabeer@gmail.com',
//   //   brandImage: ['asset/logo_image/goat.jpg', 'asset/demo_image/habesha1.jpg'],
//   //   logoImage: ['asset/logo_image/goat.jpg'],
//   //   description: "Invest in our company shares for great returns!",
//   // );
//   int indexOfImage = 0;

//   @override
//   Widget build(BuildContext context) {
//     List<String> imageUrls = [];

//     if (widget.share.shareImage != null) {
//       imageUrls = widget.share.shareImage!;
//     }
//     // final List<String> imageUrls = [
//     //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//     //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//     //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//     //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//     //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
//     // ];

//     return Scaffold(
//       appBar: AppBar(),
//       body: (MediaQuery.of(context).size.width < phoneSize)
//           ? Stack(
//               children: [
//                 Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   children: [
//                     SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: const Color.fromARGB(17, 0, 0, 0),
//                                   width: 1),
//                             ),
//                             margin: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 10),
//                             child: InkWell(
//                               // onTap: () =>
//                               //     Navigator.pushNamed(context, ChannelShop.route),
//                               child: Container(
//                                 margin: const EdgeInsets.all(5),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 45,
//                                       height: 45,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           image: DecorationImage(
//                                               fit: BoxFit.cover,
//                                               image: AssetImage(widget
//                                                   .company.logoImage.last))),
//                                     ),
//                                     // const Expanded(flex: 1, child: SizedBox()),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           '${widget.company.name}',
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           '${widget.company.motto ?? 'No description available'}',
//                                           style: TextStyle(
//                                               color:
//                                                   Color.fromARGB(120, 0, 0, 0)),
//                                         )
//                                       ],
//                                     ),
//                                     const Expanded(child: SizedBox()),
//                                     Container(
//                                       width: 160,
//                                       height: 40,
//                                       child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                               primary: Colors.blueAccent),
//                                           onPressed: () {},
//                                           child: const Text("Subscribe",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.normal,
//                                                   fontSize: 20))),
//                                     ),
//                                     // ElevatedButton(
//                                     //     onPressed: () {},
//                                     //     child: const Text(
//                                     //       "Subscribe",
//                                     //       style: TextStyle(
//                                     //           fontWeight: FontWeight.normal, fontSize: 22),
//                                     //     )),
//                                     // const Expanded(flex: 1, child: SizedBox()),
//                                     // const Icon(
//                                     //   Icons.more_vert,
//                                     //   size: 25,
//                                     // )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => Material(
//                                     child: Stack(
//                                       alignment: AlignmentDirectional.topEnd,
//                                       children: [
//                                         PhotoView(
//                                           imageProvider: NetworkImage(
//                                               imageUrls[indexOfImage]
//                                                   .split('<thumbnail>')[0]),
//                                         ),
//                                         Container(
//                                           padding: const EdgeInsets.all(12),
//                                           child: IconButton(
//                                               onPressed: () =>
//                                                   Navigator.pop(context),
//                                               icon: const Icon(
//                                                 Icons.close,
//                                                 color: Colors.white,
//                                               )),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 0),
//                               width: MediaQuery.of(context).size.width - 20,
//                               height: 250,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color.fromARGB(17, 0, 0, 0),
//                                       width: 5),
//                                   shape: BoxShape.rectangle,
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: NetworkImage(
//                                           imageUrls[indexOfImage]
//                                               .split('<thumbnail>')[0]))),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 0),
//                             child: Wrap(
//                               spacing:
//                                   8.0, // Horizontal spacing between children
//                               runSpacing: 8.0, // Vertical spacing between lines
//                               children: imageUrls.asMap().entries.map((entry) {
//                                 return InkWell(
//                                   onTap: () {
//                                     print(entry.key);
//                                     setState(() {
//                                       indexOfImage = entry.key;
//                                     });
//                                   },
//                                   child: Container(
//                                     width: 70,
//                                     height: 70,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.rectangle,
//                                       border: Border.all(
//                                           color: Colors.blue,
//                                           width: (indexOfImage == entry.key)
//                                               ? 3
//                                               : 1),
//                                       image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: NetworkImage(imageUrls[entry.key]
//                                             .split('<thumbnail>')[0]),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Center(
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     'Share Price :',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20),
//                                   ),
//                                   Text(
//                                     '${widget.share.unitSharePrice}',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.blue,
//                                         fontSize: 20),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width - 10,
//                                 child: LinearPercentIndicator(
//                                   animation: true,
//                                   animationDuration: 2000,
//                                   lineHeight: 6,
//                                   percent: 0.8,
//                                   progressColor: Colors.green,
//                                   backgroundColor: Colors.green.shade200,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               SizedBox(
//                                   width: MediaQuery.of(context).size.width - 10,
//                                   child: LineChartgraph()),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: const [
//                                       Text(
//                                         'Share Information',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20),
//                                       ),
//                                     ],
//                                   ),
//                                   ShareDetailElementWidget(
//                                     title1: 'unit Share Price ',
//                                     content: 'ETB(birr)',
//                                     contentPrice:
//                                         '${widget.share.unitSharePrice}',
//                                     title2: 'Number ',
//                                     content2:
//                                         '${widget.share.maximumNumberOfBuyer}',
//                                     contentPrice2:
//                                         '${widget.share.minimumNumberOfBuyer}',
//                                   ),
//                                   ShareDetailElementWidget(
//                                     title1: 'number share ',
//                                     content: '${widget.share.noOfShares}',
//                                     contentPrice: '200 units',
//                                     title2: 'Divident  ',
//                                     content2: '${widget.share.divident}',
//                                     contentPrice2:
//                                         // '${share.returnDividentTimeInDays}',
//                                         '',
//                                   ),
//                                   ShareDetailElementWidget(
//                                     title1: 'min payment ',
//                                     content:
//                                         '${widget.share.minimumPaymentInPercent}',
//                                     contentPrice: '!/2',
//                                     title2: 'no of share to buy ',
//                                     content2:
//                                         '${widget.share.maximumNumberOfSharesToBuy}',
//                                     contentPrice2:
//                                         '${widget.share.minimumNumberOfSharesToBuy}',
//                                   ),
//                                   ShareElementWidget(
//                                       title: 'Proclamation Number',
//                                       description:
//                                           '${widget.share.proclamationNumber}'),
//                                   ShareElementWidget(
//                                       title: 'Requiremnet ',
//                                       description:
//                                           '${widget.share.requirement}'),
//                                   ShareElementWidget(
//                                       title: 'Time to return remain payement',
//                                       description:
//                                           '${widget.share.timeToReturnRemainPayment}'),
//                                   ShareElementWidget(
//                                       title: 'Bank Information',
//                                       description:
//                                           '${widget.share.bankInformation}'),

//                                   // Text('data')
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 0, vertical: 75),
//                       width: MediaQuery.of(context).size.width,
//                       // height: 45,
//                       decoration: const BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.all(Radius.circular(15))),
//                       child: Container(
//                         margin: const EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             const Expanded(child: SizedBox()),
//                             Container(
//                               width: 160,
//                               height: 40,
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.white),
//                                   onPressed: () {},
//                                   child: const Text("Buy Now",
//                                       style: TextStyle(
//                                           color: Colors.blue,
//                                           fontWeight: FontWeight.normal,
//                                           fontSize: 20))),
//                             ),
//                             const Expanded(child: SizedBox()),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             )
//           : Stack(
//               alignment: AlignmentDirectional.bottomCenter,
//               children: [
//                 SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(
//                               color: const Color.fromARGB(17, 0, 0, 0),
//                               width: 1),
//                         ),
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 10),
//                         child: InkWell(
//                           // onTap: () =>
//                           //     Navigator.pushNamed(context, ChannelShop.route),
//                           child: Container(
//                             margin: const EdgeInsets.all(5),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 45,
//                                   height: 45,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: AssetImage(
//                                               widget.company.logoImage.last))),
//                                 ),
//                                 // const Expanded(flex: 1, child: SizedBox()),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '${widget.company.name}',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       '${widget.company.description}',
//                                       style: TextStyle(
//                                           color: Color.fromARGB(120, 0, 0, 0)),
//                                     )
//                                   ],
//                                 ),
//                                 const Expanded(child: SizedBox()),
//                                 Container(
//                                   width: 160,
//                                   height: 40,
//                                   child: ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                           primary: Colors.blueAccent),
//                                       onPressed: () {},
//                                       child: const Text("Subscribe",
//                                           style: TextStyle(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.normal,
//                                               fontSize: 20))),
//                                 ),
//                                 // ElevatedButton(
//                                 //     onPressed: () {},
//                                 //     child: const Text(
//                                 //       "Subscribe",
//                                 //       style: TextStyle(
//                                 //           fontWeight: FontWeight.normal, fontSize: 22),
//                                 //     )),
//                                 // const Expanded(flex: 1, child: SizedBox()),
//                                 // const Icon(
//                                 //   Icons.more_vert,
//                                 //   size: 25,
//                                 // )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (context) => Material(
//                                         child: Stack(
//                                           alignment:
//                                               AlignmentDirectional.topEnd,
//                                           children: [
//                                             PhotoView(
//                                               imageProvider: NetworkImage(
//                                                   imageUrls[indexOfImage]
//                                                       .split('<thumbnail>')[0]),
//                                             ),
//                                             Container(
//                                               padding: const EdgeInsets.all(12),
//                                               child: IconButton(
//                                                   onPressed: () =>
//                                                       Navigator.pop(context),
//                                                   icon: const Icon(
//                                                     Icons.close,
//                                                     color: Colors.white,
//                                                   )),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 0),
//                                   width: MediaQuery.of(context).size.width / 2,
//                                   height: MediaQuery.of(context).size.width / 3,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color:
//                                               const Color.fromARGB(17, 0, 0, 0),
//                                           width: 5),
//                                       shape: BoxShape.rectangle,
//                                       image: DecorationImage(
//                                           fit: BoxFit.cover,
//                                           image: NetworkImage(
//                                               imageUrls[indexOfImage]
//                                                   .split('<thumbnail>')[0]))),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width / 2,
//                                 child: Wrap(
//                                   spacing:
//                                       8.0, // Horizontal spacing between children
//                                   runSpacing:
//                                       8.0, // Vertical spacing between lines
//                                   children:
//                                       imageUrls.asMap().entries.map((entry) {
//                                     return InkWell(
//                                       onTap: () {
//                                         print(entry.key);
//                                         setState(() {
//                                           indexOfImage = entry.key;
//                                         });
//                                       },
//                                       child: Container(
//                                         width: 70,
//                                         height: 70,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.rectangle,
//                                           border: Border.all(
//                                               color: Colors.blue,
//                                               width: (indexOfImage == entry.key)
//                                                   ? 3
//                                                   : 1),
//                                           image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: NetworkImage(
//                                                 imageUrls[entry.key]
//                                                     .split('<thumbnail>')[0]),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Share Price :',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20),
//                                   ),
//                                   Text(
//                                     '${widget.share.unitSharePrice}',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.blue,
//                                         fontSize: 20),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width - 650,
//                                 child: LinearPercentIndicator(
//                                   animation: true,
//                                   animationDuration: 2000,
//                                   lineHeight: 6,
//                                   percent: 0.8,
//                                   progressColor: Colors.green,
//                                   backgroundColor: Colors.green.shade200,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width - 650,
//                                   child: LineChartgraph()),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: const [
//                                   Text(
//                                     'Share Information',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20),
//                                   ),
//                                 ],
//                               ),
//                               ShareDetailElementWidget(
//                                 title1: 'unit Share Price ',
//                                 content: 'ETB(birr)',
//                                 contentPrice: '${widget.share.unitSharePrice}',
//                                 title2: 'Number ',
//                                 content2:
//                                     '${widget.share.maximumNumberOfBuyer}',
//                                 contentPrice2:
//                                     '${widget.share.minimumNumberOfBuyer}',
//                               ),
//                               ShareDetailElementWidget(
//                                 title1: 'number share ',
//                                 content: '${widget.share.noOfShares}',
//                                 contentPrice: '200 units',
//                                 title2: 'Divident  ',
//                                 content2: '${widget.share.divident}',
//                                 contentPrice2:
//                                     // '${share.returnDividentTimeInDays}',
//                                     '',
//                               ),
//                               ShareDetailElementWidget(
//                                 title1: 'min payment ',
//                                 content:
//                                     '${widget.share.minimumPaymentInPercent}',
//                                 contentPrice: '!/2',
//                                 title2: 'no of share to buy ',
//                                 content2:
//                                     '${widget.share.maximumNumberOfSharesToBuy}',
//                                 contentPrice2:
//                                     '${widget.share.minimumNumberOfSharesToBuy}',
//                               ),
//                               ShareElementWidget(
//                                   title: 'Proclamation Number',
//                                   description:
//                                       '${widget.share.proclamationNumber}'),
//                               ShareElementWidget(
//                                   title: 'Requiremnet ',
//                                   description: '${widget.share.requirement}'),
//                               ShareElementWidget(
//                                   title: 'Time to return remain payement',
//                                   description:
//                                       '${widget.share.timeToReturnRemainPayment}'),
//                               ShareElementWidget(
//                                   title: 'Bank Information',
//                                   description:
//                                       '${widget.share.bankInformation}'),

//                               // Text('data')
//                             ],
//                           ),
//                           SizedBox(
//                             width: 40,
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(
//                                 horizontal: 0, vertical: 30),
//                             width: MediaQuery.of(context).size.width * 0.40,
//                             // height: 45,
//                             decoration: const BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15))),
//                             child: Container(
//                               margin: const EdgeInsets.all(10),
//                               child: Row(
//                                 children: [
//                                   const Expanded(child: SizedBox()),
//                                   Container(
//                                     width: 160,
//                                     height: 40,
//                                     child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                             primary: Colors.white),
//                                         onPressed: () {},
//                                         child: const Text("Buy Now",
//                                             style: TextStyle(
//                                                 color: Colors.blue,
//                                                 fontWeight: FontWeight.normal,
//                                                 fontSize: 20))),
//                                   ),
//                                   const Expanded(child: SizedBox()),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

// class ShareElementWidget extends StatefulWidget {
//   const ShareElementWidget({
//     Key? key,
//     required this.title,
//     required this.description,

//     // required this.function,
//   }) : super(key: key);
//   final String title;
//   final String description;

//   @override
//   State<ShareElementWidget> createState() => _ShareElementWidgetState();
// }

// class _ShareElementWidgetState extends State<ShareElementWidget> {
//   bool visablity = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 40,
//       margin: const EdgeInsets.all(5),
//       child: Column(
//         children: [
//           SizedBox(
//             width: (MediaQuery.of(context).size.width < phoneSize)
//                 ? MediaQuery.of(context).size.width - 20
//                 : MediaQuery.of(context).size.width - 600,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   widget.title,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 3,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       visablity = !visablity;
//                     });
//                   },
//                   child: visablity
//                       ? const Icon(
//                           Icons.keyboard_arrow_up_sharp,
//                           color: Colors.blue,
//                           size: 30,
//                         )
//                       : const Icon(
//                           Icons.keyboard_arrow_down_sharp,
//                           color: Colors.blue,
//                           size: 30,
//                         ),
//                 ),
//               ],
//             ),
//           ),
//           Visibility(
//               visible: visablity,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(style: TextStyle(fontSize: 12), widget.description),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               )),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/screens/partial%20screen/purchase.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/widget/share_detail_element_widget.dart';

import '../widget/analytics/graph1.dart';

class ShareDetail extends StatelessWidget {
  const ShareDetail({Key? key, required this.company, required this.share})
      : super(key: key);
  final CompanyProfileModel company;
  final ShareModel share;

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
          'Share Detail',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: (MediaQuery.of(context).size.width > phoneSize)
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                AssetImage('asset/logo_image/goat.jpg'),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          child: Text(
                            company.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              company.locationDescription,
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              company.lineOfBusiness,
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            share.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (share.shareImage[0] != '')
                            ? Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(share.shareImage[0]))),
                              )
                            : Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(share.shareImage[0]))),
                              ),
                      ],
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ShareDetailElementWidget(
                              title1: 'unit Share Price ',
                              content: 'ETB(birr)',
                              contentPrice: '${share.unitSharePrice}',
                              title2: 'Number of buyers',
                              content2: '${share.maximumNumberOfBuyer}',
                              contentPrice2: '${share.minimumNumberOfBuyer}',
                            ),
                            ShareDetailElementWidget(
                              title1: 'number of shares',
                              content: '${share.noOfShares}',
                              contentPrice: '200 units',
                              title2: 'Divident  ',
                              content2: '${share.divident}',
                              contentPrice2: '${share.bankInformation}',
                            ),
                            ShareDetailElementWidget(
                              title1: 'minimum payment ',
                              content: '${share.minimumPaymentInPercent}',
                              contentPrice: 'half of the share price',
                              title2: 'number of share to buy ',
                              content2: '${share.maximumNumberOfSharesToBuy}',
                              contentPrice2:
                                  '${share.minimumNumberOfSharesToBuy}',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: Text(
                                share.proclamationNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: const Text(
                                "saving account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: const Text(
                                "requirment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: const Text(
                                "time to return remain payment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage('asset/logo_image/goat.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      child: Text(
                        company.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Iconsax.location,
                          color: Colors.grey,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          company.locationDescription,
                          // style: STextTheme.lightTextTheme.bodySmall
                          //     ?.copyWith(color: Colors.blue),
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Iconsax.location,
                          color: Colors.grey,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          company.lineOfBusiness,
                          // style: STextTheme.lightTextTheme.bodySmall
                          //     ?.copyWith(color: Colors.blue),
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        share.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(share.shareImage[0]))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        ShareDetailElementWidget(
                          title1: 'unit Share Price ',
                          content: 'ETB(birr)',
                          contentPrice: '${share.unitSharePrice}',
                          title2: 'Number of buyers',
                          content2: '${share.maximumNumberOfBuyer}',
                          contentPrice2: '${share.minimumNumberOfBuyer}',
                        ),
                        ShareDetailElementWidget(
                          title1: 'number of shares',
                          content: '${share.noOfShares}',
                          contentPrice: '200 units',
                          title2: 'Divident  ',
                          content2: '${share.divident}',
                          contentPrice2: '${share.bankInformation}',
                        ),
                        ShareDetailElementWidget(
                          title1: 'minimum payment ',
                          content: '${share.minimumPaymentInPercent}',
                          contentPrice: 'half of the share price',
                          title2: 'number of share to buy ',
                          content2: '${share.maximumNumberOfSharesToBuy}',
                          contentPrice2: '${share.minimumNumberOfSharesToBuy}',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: Text(
                            share.proclamationNumber,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: const Text(
                            "saving account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Iconsax.arrow_down_14,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: const Text(
                            "requirment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Iconsax.arrow_down_14,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: const Text(
                            "time to return remain payment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Iconsax.arrow_down_14,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // LineChartgraph(),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(3)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Purchase())));
                              },
                              child: const Center(
                                child: Text("BUY",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ),
                            ),
                          ),
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
