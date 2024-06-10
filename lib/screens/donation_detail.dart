// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:ssen_user/Models/company_profile_model.dart';
// import 'package:ssen_user/utils/utils.dart';

// class DonationDetail extends StatelessWidget {
//   const DonationDetail({Key? key, required this.company}) : super(key: key);
//   final CompanyProfileModel company;
//   @override
//   Widget build(BuildContext context) {
//     final List<String> imageUrls = [
//       'data:image/jpeg;base64,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',
//       'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUSEhgVFRISEhISGBEREhEYFRIRERERGBgZGRgYGBgcIS4lHB4rIRgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHjQkISQ0NDQ0NDQ0NDE0NDQ0NDQ0NDQxNDQ0MTE0NDQ0MTQ0NDQ0NDQ0NDQ2NDQxNDQ0NDQ0Mf/AABEIAKgBKwMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAEBQACAwEGBwj/xABAEAACAQIDBAgDBQYFBQEAAAABAgADEQQSIQUxQVEGEyIyYXGBkVKhsRQjQmLBQ3KS0eHwFTOCorKjs8LS8Rb/xAAYAQADAQEAAAAAAAAAAAAAAAAAAQIDBP/EACARAAMBAAMBAQADAQAAAAAAAAABAhESITEDQSIyYRP/2gAMAwEAAhEDEQA/AE7NOAwXD4taguDNGe04sO/TVlmRnUqXlcTVCi5gI870gOsRmH7Sr9Y/hAss6oWSctvaKyS2WTLKJwqpsb8p6PZ2IDKBPOFZvhsQaZ8JNzyRXzriz0zTBpjQxoYb5d3HOc/Fo6eSZV4BjXsJtXxIEVVqhYzWJfpjdLMKSCSQTYwLrGuxh24rWNtijtyK8Lj+w/xNTKLzNNoy+PHYiVFmcymjaqaY+TaEKp46JKQhtESuKJ5McJiiYTTqExdQjClHhLY0wG+Ma+6LcAdYyr7ov0RVBN0g6GEIYyWEJNkmCGbIYCCqM2EHoma3gM2Uy0yBnbwEaAy4MyUS4iA7edvOATuWAH5gw2KemdDpyjehtjnEkkqpTLmmj0DbYHCLsVtFqnHSAXkiUJDdtlmaVkM5LJLXnLyTkAIZydC3mj4ZlFyNIaGMyBI3GWNZucqTKmGC0jMTJJJGIkgnBOiAjRI22KR1gBZVvuJDm55dkHWKljrYjqqVSwDWWmES1yXLd4cdAD7yK8Kn0bPiEqWVesubAHq3ykkEj3APtBcRgWp5WJDK98rDON1rghgCN4lMNUY1FYCy51OhF943AG99frPU9MlTqsOykC61Fen3TcWKuVPgzC/5QJC6ZrR5ulDacBpQ2ipJsJQg6kYzwyaQTDYVrgERq9MIJLYYbYHRozxA0irA96N63dh+kmKQhJhTEJRYyWarNVlVWbIsYjaiJqBKUtJqDAZ0CXAkDSwaAjoEsBK5p3PAC1p20p1knWRgfl7KeUhEcpUp+E4wpnlJ5f4bcP8ARNaSNyieE51KGPkLgKZLRscKkr9kTnDmg4MVyRocEnOZvggNxMfJC4MEww7QjnHr93u4QfB4WxuZ6BcMrpYiY3a5I2iHxZ4cicMfbQ2Iy3KD04RHUplTYixm02q8MKlz6UkkIklEEnROTojEaLGuyhanXblSyfxuP/WK0EZ4Grkp1Fy5+s6tLbjmzaW+fyk14XPprss/eIfzLr6z6P0mwq1Ewzm3cqJ7FT/5GL9lbYbraKmpRFmC5QlRkGhFs1/mBaNemVfNSpkKEKPUQgd27KDp/DMlTr1YaZjQkpYFPCF0cKoIOkTUq7c4bTrtzhjKY7SmNLTZqObfFNLFGGUsUYJEsPo4YKYbVXswHD4i5tGL92MhmNNYQgmKTdDGSwhBNUmKtNFaMRuJZZiHls8ANwZa8HDy4eAGt5JQPLB4AWtJlkDyZoAfmS06JacEZRy0mvMy05ACBjzM6CeZnCJdBBjRrTBPEwtDbfBg01VSwmdGsjFF3HhGmGr8Ikw9FyN5h2GoONL+cxpI2ljumQ2+K9o7MSpuGsIoUGB3mbPQa+hmaePobW+nisbs56Z5j5wAz22JwLPcGeWx2FKVMu8ndOv5/Tl0zm+nzztAUsIU2zXC5rSn2cgAkhbkgAmxNrX8OI3zRUmZOWiqRrg6yrTsVGtRLv8AiC2G7y1PrFpplTqLfr5HjHNMqmFRiitnq3IPEJawHLjFXg59PXbK2cy1aSgBlulqgsabc2zW3WvpvHOOemZBwlkAPVVaXbG9hkdSfK9vlPOYbbGGzI/2QrlZWIDCxt/fKer29iFxGz3yolNi1NqdPMuZyrgsBuzNlzGw10mEb+mt/h8/p1DzhlKoYAu+FUzNSRjSaHUmiym8MpPGIc4JtY3qP2YgwVTWNqr9mS/Qw0R5srxelSaq8ZODBXlxUgaPNFaAsC1eXVoOhm6xgaAzQTNRNFEBFll1nFE0AgB1RLZZFE7aAj8yyGdkMZocEhm1CjnOk0q4QrvMOSGpeaCSBzGWGwCsLkwoUqacpDpFKGKVV/hPtLpXIM9AjoUJAEQVQC5tuiVcvwtzx8YXTxREPp4s24wDC0QTrHGFoLxEyvDSdOpjSBuN/KbJjTbcb+Uu1FeUrZF3zPosgxTcvlFL4V3qhyNJ6BFUi4GkwfGIpsAI5bXiE0n6danmUDLEHSbCZURwPxMp/wBQBH/Ex79tuNBFu06wqoysLX1B5MNQZfz1Vpn9MctHm6RaxtuNvLj898LfFvoCQyqAArKrKNANL7t0zydXRW47Tu7HwVOyB7s3ymKXY2Aud/pzPIeM6njOVDKntOqNFYIPyogIPMMRcehmiV3Zw71KjsLAOzM7gcrsbzPD4IWu9Q+SLm08WYix8gZ6zovs6gWzFM5IZMlXJVpjUdoKFU5tOfGZ6l4jXK/TXH4cVlTEga1gyVRa336WBbTdnVkfzJit7Cey6QFaYSilOlTpj7xciZASQFNxew3f7Z5t8IGkp56NLUCU3hSPNKOCAhS4MGPkLiWwD9qOK79mL8NhQpvCsQdIb2POjqPN0aBpCUEZAWhhCwamIWkZLNkE3WYJCEgI1QTRRKLNBGIsomomYmggBYTsqDO3gI/Meec6yXNITBllIp6gnD4rIYS2M6yK4Tg11iqV6VNPwK68rpeZVK1+MIqKvGVyJ4SE0W0zWnjexlmVJLyhQX0m9IaxPF4UtfofhkjbDILeMVYfT++Ea0F0nPZvIUUFoNi6AK+ULRLiZunCQhiZdrKgKHeNIIu0UBJNoFtvDZKl+cWTriJa05ruk8PRDbCjTSarUDrm4Ty89Ps8fd+kKlT4E069F+110pqNTkJtxJZ2I/SZ4em18qozKO8yqzB253A3b7e/Ey+PqXqOw3UwqJ5iyA++sI2HimByogY90CwJNxb6c5b1T0Qs5BCU2C6q481YT0/Rui41NOoqkk3KOBbne1rRNia2UAiphw/ZFrOygXH4shThwJnvNmYxzTXOqhu81gu9tbi2ljodPQzFaa09FfSfFWYj4KdF/TNUnn6e0oZt/EZsTX/LRonztU3+z/OedSpbTlpLzSU86Hq7Sm6bRiFKsJpuIcQ09HhMXnNofVFxEuyzcx+lQDfB9DMUU8oVTEgrLN6TiLSGi9OEJOIQYQlEnhKTIZEmyGdVLbxLqBDRYXUywMqLSwtHoYXBlwZRbS0eiLgzt5nedvAD82lJtRwWfdBmzCEUsW1PW0T38Nln6O8F0Tapxt6Q5+iBpjNmJgOz+ktQaKpPrGeK2riHS5Ww85hVWumzRTL7R53aOEymK8loRi8YxJvBg95vKaXZnTTfRvThdEwNDC6KyaKgPogmMsM3CA4Z7CG0Zz0boPVyBbnOMpGs4h5azWq1xaSMQbdw2dbgajWecOGblPa1qd0M8niMVlYi24zo+NPMRh9ZW6wQYZuU9DgOymvAX9heI/tp5Ryj/cufyP8A8TLrXmmcYtwRMxKN4vTv7Of0j3YmCLocg7bIwXhmIYNbwJQMORvEFvuyfz0wPRXv9R7x5svab06ZCKR3VFTWytv04E+ftHe50Kc3sOq4RdFYW7t++rX0uN2jC536dk79L++2Vg3TDoGHaWnc/lBYkDxOXW3C8+fYzaNV8r9UjObDrAj5nt5GxPkJ9G6P4qvUwyB6bHSzP3Tbu3K+huQBx5THKS7NKafh4LGVM2LxY5USv8L0h/OBKg387H31ncLUz4nFtcHMmIsRuP3tO3yEzV+yPL6afpNiDdKdzCRh2GttJzA2uLz0tWmuTS17SWysAdkxrVeK9n74ViXtF+jCVaFUKkUpVhmGqaiMkb062XfGmGx4tuimqwyzbAnSBLQzqYsNMhUgjNrLq8aJC1aaK8EV5cVIxYFB5cPBQ8uHgATmnc8HzzueAj8/nUS9dR1cxRriFV0+7kvpo3XjGHRrDgkXEfdIa6pSsN9om6MP2rTXpjU0A5zFrl9MZaeSeVc315zqCRV0nQJ1NmKRrTEOoiB09IXTvM6NZD6A1jOiNPCLqKaQ2gTOdmyDsMwEs++UQ3E2pJpJGYniOc8Zt2hlqX4GexrXUxJt/D5lzW3azT5VlGf0WyeWjpnth3/dUe7KIpKRo6E0so3uyL9T+k6q/DmnpMV1zZEHE53PhmIUD2QH/VPVbFwqMBTZSULoe8wserdr3HibW8Z5LFOC5I3aBf3VGVfkBHOz9oKiKpoJUZVZQ5sGGYkgggX0Jv8A3rNptdDhpNnpNrKUoUUGfKHqLrexAzhQ3A20NvCfQcLVUo+Uo7KcR1nZXMAMxRWG+w7IvpfKDxnyjG7XRjnOFQksG7w53+D08p6jD9IUOEYrRRGRKtgLEU82a2WwFu9aZqWkU3p4/o/UzVKp+KjVJ9XpmM9m0A6a8CR+v6xP0YP3rDnSqDzsVP6Rzs5Tkfwb6j+kuugjsPp4RRutDVGlr6RZTVzzhNZHVb3memjGFCmBA8fU7U5gapaY47VpU+kvwvTeHYZ9YsoLeMaAy8Y2yUhvUqdmF4NrLEb17xphauZNOUT8DAjPrLq8DLydZBEtDBakurxcKhl1rShDEPLB4AtaXFWMQeKk71kCFSXzwFh8LpcI5x9O1IHyipCM2kbbSxOamF8pNf2RtPjMujlS1QRj0tpHKG4Tz2DqFHB8Z7qhiKWIpZXte2okX/GuRU9zh8+V5dTPR7S2JTRCymeaUTSaVLUQ5chNNhDUAtvi9LQmmb85NIuWMqNXheMKdgN8UUKTcFf+EmM6OFqH8FT+EzGkaphtKoDpNWrBPGZ0dmv8Lj0tCRshz+FjIwegzVgdYDjHDoR6RhU2c40WmYM+zcQf2bW/0gfWOV2Daw82+FtLVnyU/EkqvopLH2uPWPW2HXP7M+6/znm9tI1N2RtGpjKRyd7E/wC0CdMPkzmtYhUupEebLr9WCpwtOvc3zOmdl0ta9jbnbz8LI0GsY0toNT0Cow0NmW403aAjnNW3+Gcpfo0qbRRSG+yUWUBUyMLgMGzXOmptpe3y0jTH4ovg3y4VaAbtdlSii9gVW4AC6E2G8km196Jdps1jkS4zWFmK6C/dJIm2P25VqUmpslJQAouiZLhQAL2Nt3hM9b6wvEuwboy1sSo+JK6/9Nz+kaM7IGy7y9vYf1iXYDWxKHwq/wDbePsTWWmy5u65Zr8jZR+hjpdhD6C8NjjkAtYztas9RbbpejhGIDBGIOoIBII8DCRhHH4G9jMukamez1Kixm1RAxl6WGf4G9pp9lc/gaGiB0oW3TUUzzhaYF/gPym6YJ/gPyj5CAadM8YdhqxUWtNPsLj8H0lhgn+H6Q0DPMSZdWl1wr/DLrhW+ExpokoGlwZqtA/CZbqjyPtDRYYiaLNVp+EsEj0WFFlry+WUymGiPH0+g6A3NY6eAhLdFqBFjUqH2hfXPuL+lll1xTjcV9hMnTN8A06JYYb+sPm1obhOj+GU9x9PzGcOKc8QSPAThxTD8QHhpBthgc+ycNaxp5vAkmYpszDKdKFO/wC5eCtjHOma3jpKDENf/MP+2GhgWcJSB0pU/PIBNVpoo0pqPHKIvFY7850/dt9J1sW3xG27h/KLQwZq+UXyjXTQAWlvtVtwMUio1u89vMzN6hO8v7mLR4NnxTf10tKjEm29hfeTbXyil2NrZntyu02wSKxYOzKMoytmYWbOo9dCxt4RBgxRid/DgdJarWsL3Hl4RRh1DHtkgZahGp74Rinu2UTSph6XVpY3qEv1ikaAXIA1O+wB3cePADAw4oJTZzbKgZjvJ0F90+WYhzXqM7nKXdna5G9joPIDSfR2wtHIt7oxfLUBAIyk6MoHIc95PhBquzsI1S1mNPK9yyqGL2NrZSLcLXvra4tNIriTU6fPq9FEZcrhrjXwa+76Qd1N9B7T29HYGHapZhZO2Se6TZSVHG1yAPWZ1+jOHWmxzHOXK0wLEZBm1bz7P11vpovqiHDPG03ZSCNPe3Efz/sy1R7j6DkBoJ67HdHaBydWuXs3qGz2zE8MztbThw5m+midE8OzIOscBkbrGsOy+TOtt9hdlTjqjHiAH/0nQ4Vh5PY5Ar0yWC2dPUFgCvqCY3xYNQW5bvAxlU6LYfK5U1VIZOrDFWLIQ181gANQDf8AMB4w/D4NRTbPmeoGQIzBWbLrmZja7d22p/ENear6T6gmGgXopVrUyyE5qGUk3OlNuFuV91uc9WuMU8QNN3P1gS0KbMELt1eSmFOVaYSoWQOVUXFgC5tpuIvxMw1ClanmbtMSKqns5FvZbexPqJjT5PTRLEHpil4maCso1uLHTyMW16aKH+8JKtamNO0oYDXzDXH7jcxKU6ilWOY5hlyLlPa111twEkeDvrQRob8N+6Zs+Uix+ZtFSYg7uE0622kNFxHDVybay61dN/pFKP4fSEowYbteceiwOL31llqEcrQRTz95cXEeiwKFTWXV+EFVv7vOo8eiwNznw8ZBY8BBkqec2V9P/kNFh1qQ5Wlep8ZojTS/h85Wknxr/wDRVSd6/wAImp6QVfiX+ESSS3KNFTKHbta3f8tBBKm16p/afIXvOyQUoTpnP8Vq/GT7SDa1X4/pOyR8UGsIG1qtv8y3tOrtNx+014bpJJOIfJl021UH7Q+wtM321Wvo9h5CSSGIOTOf4xW4sTNV25V3X+QMkkfFBrNU25UHHf8Almi7aqWte/pJJIcoes4dsvyHtKDblS+5ZJIcUGsum3KnJfQGcq7bc/hQ213SSQ4oOTOJtx/hXXSb09uP8IkkjcoaZf8AxlyQco95oNtN8KySSOKGaU9sHgo+U4Npm/dXXWdki4oZZto3/CPOUTaJ8PedkjxAWbaJ8IRT2gSLae0kkMQGgxx5zRMaZJIhBlLF6TUYvxkkgSdTF+ImoxPjJJGhGqVz4+2kuuOHOSSMCx2gg3k/OafbhyMkkZLP/9k=',
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: Colors.blue,
//               size: 20,
//             )),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Donation Detail',
//           style: TextStyle(
//             decoration: TextDecoration.none,
//             color: Colors.blue,
//             // fontSize: 27,
//             // fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               (company.logoImage[0] != "")
//                   ? Container(
//                       child: CircleAvatar(
//                         radius: 45,
//                         backgroundImage:
//                             NetworkImage(getImage(company.logoImage[0])),
//                       ),
//                     )
//                   : Container(
//                       child: const CircleAvatar(
//                         radius: 45,
//                         backgroundImage: AssetImage('asset/default avatar.jpg'),
//                       ),
//                     ),
//               const SizedBox(
//                 height: 14,
//               ),
//               Container(
//                 child: Text(
//                   company.name,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: [
//                   const Icon(
//                     Iconsax.location,
//                     color: Colors.grey,
//                     size: 12,
//                   ),
//                   const SizedBox(
//                     width: 3,
//                   ),
//                   Text(
//                     company.locationDescription,
//                     // style: STextTheme.lightTextTheme.bodySmall
//                     //     ?.copyWith(color: Colors.blue),
//                     style: TextStyle(fontSize: 13, color: Colors.grey),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 child: Text(
//                   company.description,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 7,
//                   style: TextStyle(fontSize: 15),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               // Container(
//               //   child: ImageSlideshow(
//               //     width: MediaQuery.of(context).size.width / 0.7,
//               //     height: 250,
//               //     initialPage: 0,
//               //     indicatorColor: Colors.blue,
//               //     indicatorBackgroundColor: Colors.grey,
//               //     onPageChanged: (value) {
//               //       // print('Page changed: $value');
//               //     },
//               //     autoPlayInterval: 10000,
//               //     isLoop: true,
//               //     children: imageUrls.map((url) {
//               //       return Container(
//               //           decoration: BoxDecoration(
//               //         image: DecorationImage(
//               //             fit: BoxFit.cover, image: NetworkImage(url)),
//               //       ));
//               //     }).toList(),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//         //
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_company_profile_methods.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/firebase_company_service_method.dart';
import 'package:ssen_user/screens/partial%20screen/purchase.dart';
import 'package:ssen_user/screens/state%20pages/company_profile.dart';
import 'package:ssen_user/widget/analytics/graph_circular.dart';

import '../Models/share_model.dart';
import '../Models/user_model.dart';
import '../provider/user_provider.dart';
import '../utils/constants.dart';
import '../widget/analytics/graph1.dart';
import '../widget/analytics/graph2.dart';
import '../widget/share_detail_element_widget.dart';

class DonationDetail extends StatefulWidget {
  DonationDetail({super.key, required this.company, required this.share});

  final CompanyProfileModel company;
  final ShareModel share;
  @override
  State<DonationDetail> createState() => _DonationDetailState();
}

class _DonationDetailState extends State<DonationDetail> {
  // ShareModel share = ShareModel(
  //   savingAccountPercentage: 12.5,
  //   proclamationNumber: "PRO123",
  //   minimumNumberOfBuyer: 5,
  //   maximumNumberOfBuyer: 20,
  //   bankInformation: ['Bank A', 'Bank B', 'Bank C'],
  //   shareImage: ['asset/logo_image/goat.jpg', 'asset/demo_image/habesha1.jpg'],
  //   unitSharePrice: 15.75,
  //   noOfShares: 500,
  //   divident: 7.2,
  //   minimumPaymentInPercent: 10.0,
  //   minimumNumberOfSharesToBuy: 1.0,
  //   maximumNumberOfSharesToBuy: 50.0,
  //   requirement: "Valid ID proof required",
  //   identification: "ABC123",
  //   companyID: "COMP456",
  //   description: "Invest in our company shares for great returns!",
  //   searchKeyWords: ['investment', 'shares', 'dividend'],
  //   returnDividentDescription: ["Yearly", "Biannually"],
  //   timeToReturnRemainPayment: 90,
  //   currency: "USD",
  //   dateAdded: "2024-05-18",
  //   isDeleted: false,
  //   isHidden: false,
  // );
  // CompanyProfileModel company = CompanyProfileModel(
  //   name: 'Habesha Beer',
  //   businessSector: 'Agriculture',
  //   lineOfBusiness: 'lineOfBusiness',
  //   yearOfEstablishment: '2001',
  //   email: 'habeshabeer@gmail.com',
  //   brandImage: ['asset/logo_image/goat.jpg', 'asset/demo_image/habesha1.jpg'],
  //   logoImage: ['asset/logo_image/goat.jpg'],
  //   description: "Invest in our company shares for great returns!",
  // );
  int indexOfImage = 0;

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [];

    if (widget.share.shareImage != null) {
      imageUrls = widget.share.shareImage!;
    }
    // final List<String> imageUrls = [
    //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    //   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    //   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    //   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    // ];
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.company.name),
      ),
      body: (MediaQuery.of(context).size.width < phoneSize)
          ? Stack(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
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
                                          image: NetworkImage(widget
                                                  .company.logoImage.isNotEmpty
                                              ? widget.company.logoImage[0]
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
                                            widget.company.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            widget.company.lineOfBusiness ??
                                                'No description available',
                                            style: const TextStyle(
                                              color:
                                                  Color.fromARGB(120, 0, 0, 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    (!widget.company.subscribersID
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
                                                    .subscribeUser(
                                                        widget.company, user);
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
                                                        widget.company, user);
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
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Material(
                                    child: Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        PhotoView(
                                          imageProvider: NetworkImage(
                                              imageUrls[indexOfImage]
                                                  .split('<thumbnail>')[0]),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          child: IconButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              width: MediaQuery.of(context).size.width - 20,
                              height: 250,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(17, 0, 0, 0),
                                      width: 5),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          imageUrls[indexOfImage]
                                              .split('<thumbnail>')[0]))),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Wrap(
                              spacing:
                                  8.0, // Horizontal spacing between children
                              runSpacing: 8.0, // Vertical spacing between lines
                              children: imageUrls.asMap().entries.map((entry) {
                                return InkWell(
                                  onTap: () {
                                    print(entry.key);
                                    setState(() {
                                      indexOfImage = entry.key;
                                    });
                                  },
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          color: Colors.blue,
                                          width: (indexOfImage == entry.key)
                                              ? 3
                                              : 1),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(imageUrls[entry.key]
                                            .split('<thumbnail>')[0]),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${widget.share.description}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    maxLines:
                                        null, // This allows the text to wrap to the next line as needed
                                    overflow: TextOverflow
                                        .visible, // Ensures that overflow is handled gracefully
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              ShareElementWidget(
                                  title: 'Proclamation Number',
                                  description:
                                      '${widget.share.proclamationNumber}'),
                              ShareElementWidget(
                                  title: 'Requiremnet ',
                                  description: '${widget.share.requirement}'),
                              ShareElementWidget(
                                  title: 'Time to return remain payement',
                                  description:
                                      '${widget.share.timeToReturnRemainPayment}'),
                              ShareElementWidget(
                                  title: 'Bank Information',
                                  description:
                                      '${widget.share.bankInformation}'),
                              SizedBox(
                                height: 20,
                              ),
                              // SizedBox(
                              //     width: MediaQuery.of(context).size.width - 10,
                              //     child: LineChartgraph(
                              //       id: widget.company.identification,
                              //     )),
                              // CircularIndicator(
                              //   company: widget.company,
                              //   radius: 10,
                              // )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Share Information',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  ShareDetailElementWidget(
                                    title1: 'unit Share Price ',
                                    content: 'ETB(birr)',
                                    contentPrice:
                                        '${widget.share.unitSharePrice}',
                                    title2: 'Number ',
                                    content2:
                                        '${widget.share.maximumNumberOfBuyer}',
                                    contentPrice2:
                                        '${widget.share.minimumNumberOfBuyer}',
                                  ),
                                  ShareDetailElementWidget(
                                    title1: 'number share ',
                                    content: '${widget.share.noOfShares}',
                                    contentPrice: '200 units',
                                    title2: 'Divident  ',
                                    content2: '${widget.share.divident}',
                                    contentPrice2:
                                        // '${share.returnDividentTimeInDays}',
                                        '',
                                  ),
                                  ShareDetailElementWidget(
                                    title1: 'min payment ',
                                    content:
                                        '${widget.share.minimumPaymentInPercent}',
                                    contentPrice: '!/2',
                                    title2: 'no of share to buy ',
                                    content2:
                                        '${widget.share.maximumNumberOfSharesToBuy}',
                                    contentPrice2:
                                        '${widget.share.minimumNumberOfSharesToBuy}',
                                  ),
                                  ShareElementWidget(
                                      title: 'Proclamation Number',
                                      description:
                                          '${widget.share.proclamationNumber}'),
                                  ShareElementWidget(
                                      title: 'Requiremnet ',
                                      description:
                                          '${widget.share.requirement}'),
                                  ShareElementWidget(
                                      title: 'Time to return remain payement',
                                      description:
                                          '${widget.share.timeToReturnRemainPayment}'),
                                  ShareElementWidget(
                                      title: 'Bank Information',
                                      description:
                                          '${widget.share.bankInformation}'),

                                  // Text('data')
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: 0, vertical: 75),
                    //   width: MediaQuery.of(context).size.width,
                    //   // height: 45,
                    //   decoration: const BoxDecoration(
                    //       color: Colors.blue,
                    //       borderRadius: BorderRadius.all(Radius.circular(15))),
                    //   child: Container(
                    //     margin: const EdgeInsets.all(10),
                    //     child: Row(
                    //       children: [
                    //         const Expanded(child: SizedBox()),
                    //         Container(
                    //           width: 160,
                    //           height: 40,
                    //           child: ElevatedButton(
                    //               style: ElevatedButton.styleFrom(
                    //                   primary: Colors.white),
                    //               onPressed: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => Purchase(
                    //                             share: widget.share,
                    //                             user: user,
                    //                           )),
                    //                 );
                    //               },
                    //               child: const Text("Buy Now",
                    //                   style: TextStyle(
                    //                       color: Colors.blue,
                    //                       fontWeight: FontWeight.normal,
                    //                       fontSize: 20))),
                    //         ),
                    //         const Expanded(child: SizedBox()),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            )
          : Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
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
                                GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Companyprofile(
                                                  company: widget.company,
                                                )));
                                  }),
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(widget
                                                .company.logoImage.last))),
                                  ),
                                ),
                                // const Expanded(flex: 1, child: SizedBox()),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.company.name}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${widget.company.lineOfBusiness}',
                                      style: TextStyle(
                                          color: Color.fromARGB(120, 0, 0, 0)),
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                (!widget.company.subscribersID
                                        .contains(user.identification))
                                    ? Container(
                                        width: 160,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent,
                                          ),
                                          onPressed: () async {
                                            await FirebaseCompanyServiceMethod()
                                                .subscribeUser(
                                                    widget.company, user);
                                            await Provider.of<UserProvider>(
                                                    context,
                                                    listen: false)
                                                .refreshUser();
                                          },
                                          child: const Text(
                                            "Subscribe",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 160,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blueAccent,
                                          ),
                                          onPressed: () async {
                                            await FirebaseCompanyServiceMethod()
                                                .unSubscribeUser(
                                                    widget.company, user);
                                            await Provider.of<UserProvider>(
                                                    context,
                                                    listen: false)
                                                .refreshUser();
                                          },
                                          child: const Text(
                                            "UnSubscribe",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                // ElevatedButton(
                                //     onPressed: () {},
                                //     child: const Text(
                                //       "Subscribe",
                                //       style: TextStyle(
                                //           fontWeight: FontWeight.normal, fontSize: 22),
                                //     )),
                                // const Expanded(flex: 1, child: SizedBox()),
                                // const Icon(
                                //   Icons.more_vert,
                                //   size: 25,
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Material(
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                          children: [
                                            PhotoView(
                                              imageProvider: NetworkImage(
                                                  imageUrls[indexOfImage]
                                                      .split('<thumbnail>')[0]),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              child: IconButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              const Color.fromARGB(17, 0, 0, 0),
                                          width: 5),
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              imageUrls[indexOfImage]
                                                  .split('<thumbnail>')[0]))),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Wrap(
                                  spacing:
                                      8.0, // Horizontal spacing between children
                                  runSpacing:
                                      8.0, // Vertical spacing between lines
                                  children:
                                      imageUrls.asMap().entries.map((entry) {
                                    return InkWell(
                                      onTap: () {
                                        print(entry.key);
                                        setState(() {
                                          indexOfImage = entry.key;
                                        });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              color: Colors.blue,
                                              width: (indexOfImage == entry.key)
                                                  ? 3
                                                  : 1),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                imageUrls[entry.key]
                                                    .split('<thumbnail>')[0]),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Share Price :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    '${widget.share.unitSharePrice}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * .45,
                                  child: PercentIndicator(
                                      company: widget.company, lineheight: 6)
                                  // LinearPercentIndicator(
                                  //   animation: true,
                                  //   animationDuration: 2000,
                                  //   lineHeight: 6,
                                  //   percent: 0.8,
                                  //   progressColor: Colors.green,
                                  //   backgroundColor: Colors.green.shade200,
                                  // ),
                                  ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: LineChartgraph(
                                    id: widget.company.identification,
                                  )),
                              Row(
                                children: [
                                  CircularIndicator(
                                    company: widget.company,
                                    radius: 10,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${widget.share.description}',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines:
                                    null, // This allows the text to wrap to the next line as needed
                                overflow: TextOverflow
                                    .visible, // Ensures that overflow is handled gracefully
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Share Information',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                              ShareDetailElementWidget(
                                title1: 'unit Share Price ',
                                content: 'ETB(birr)',
                                contentPrice: '${widget.share.unitSharePrice}',
                                title2: 'Number ',
                                content2:
                                    '${widget.share.maximumNumberOfBuyer}',
                                contentPrice2:
                                    '${widget.share.minimumNumberOfBuyer}',
                              ),
                              ShareDetailElementWidget(
                                title1: 'number share ',
                                content: '${widget.share.noOfShares}',
                                contentPrice: '200 units',
                                title2: 'Divident  ',
                                content2: '${widget.share.divident}',
                                contentPrice2:
                                    // '${share.returnDividentTimeInDays}',
                                    '',
                              ),
                              ShareDetailElementWidget(
                                title1: 'min payment ',
                                content:
                                    '${widget.share.minimumPaymentInPercent}',
                                contentPrice: '!/2',
                                title2: 'no of share to buy ',
                                content2:
                                    '${widget.share.maximumNumberOfSharesToBuy}',
                                contentPrice2:
                                    '${widget.share.minimumNumberOfSharesToBuy}',
                              ),
                              ShareElementWidget(
                                  title: 'Proclamation Number',
                                  description:
                                      '${widget.share.proclamationNumber}'),
                              ShareElementWidget(
                                  title: 'Requiremnet ',
                                  description: '${widget.share.requirement}'),
                              ShareElementWidget(
                                  title: 'Time to return remain payement',
                                  description:
                                      '${widget.share.timeToReturnRemainPayment}'),
                              ShareElementWidget(
                                  title: 'Bank Information',
                                  description:
                                      '${widget.share.bankInformation}'),

                              // Text('data')
                            ],
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 30),
                            width: MediaQuery.of(context).size.width * 0.35,
                            // height: 45,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Container(
                                    width: 160,
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Purchase(
                                                      share: widget.share,
                                                      user: user,
                                                    )),
                                          );
                                        },
                                        child: const Text("Buy Now",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20))),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class ShareElementWidget extends StatefulWidget {
  const ShareElementWidget({
    Key? key,
    required this.title,
    required this.description,

    // required this.function,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  State<ShareElementWidget> createState() => _ShareElementWidgetState();
}

class _ShareElementWidgetState extends State<ShareElementWidget> {
  bool visablity = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width < phoneSize)
                ? MediaQuery.of(context).size.width - 20
                : MediaQuery.of(context).size.width - 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      visablity = !visablity;
                    });
                  },
                  child: visablity
                      ? const Icon(
                          Icons.keyboard_arrow_up_sharp,
                          color: Colors.blue,
                          size: 30,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.blue,
                          size: 30,
                        ),
                ),
              ],
            ),
          ),
          Visibility(
              visible: visablity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(style: TextStyle(fontSize: 12), widget.description),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:ssen_user/Models/company_profile_model.dart';
// import 'package:ssen_user/Models/share_model.dart';
// import 'package:ssen_user/screens/partial%20screen/purchase.dart';
// import 'package:ssen_user/utils/constants.dart';
// import 'package:ssen_user/utils/constants/colors.dart';
// import 'package:ssen_user/widget/share_detail_element_widget.dart';

// import '../widget/analytics/graph1.dart';

// class ShareDetail extends StatelessWidget {
//   const ShareDetail({Key? key, required this.company, required this.share})
//       : super(key: key);
//   final CompanyProfileModel company;
//   final ShareModel share;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: Colors.blue,
//               size: 20,
//             )),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Share Detail',
//           style: TextStyle(
//             decoration: TextDecoration.none,
//             color: Colors.blue,
//             // fontSize: 27,
//             // fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//       body: (MediaQuery.of(context).size.width > phoneSize)
//           ? SingleChildScrollView(
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           child: const CircleAvatar(
//                             radius: 45,
//                             backgroundImage:
//                                 AssetImage('asset/logo_image/goat.jpg'),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 14,
//                         ),
//                         Container(
//                           child: Text(
//                             company.name,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             const Icon(
//                               Iconsax.location,
//                               color: Colors.grey,
//                               size: 12,
//                             ),
//                             const SizedBox(
//                               width: 3,
//                             ),
//                             Text(
//                               company.locationDescription,
//                               // style: STextTheme.lightTextTheme.bodySmall
//                               //     ?.copyWith(color: Colors.blue),
//                               style:
//                                   TextStyle(fontSize: 13, color: Colors.grey),
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             const Icon(
//                               Iconsax.location,
//                               color: Colors.grey,
//                               size: 12,
//                             ),
//                             const SizedBox(
//                               width: 3,
//                             ),
//                             Text(
//                               company.lineOfBusiness,
//                               // style: STextTheme.lightTextTheme.bodySmall
//                               //     ?.copyWith(color: Colors.blue),
//                               style:
//                                   TextStyle(fontSize: 13, color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           child: Text(
//                             share.description,
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 5,
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         (share.shareImage[0] != '')
//                             ? Container(
//                                 height: 250,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image:
//                                             AssetImage(share.shareImage[0]))),
//                               )
//                             : Container(
//                                 height: 250,
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image:
//                                             AssetImage(share.shareImage[0]))),
//                               ),
//                       ],
//                     )),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Expanded(
//                         child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 70,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             ShareDetailElementWidget(
//                               title1: 'unit Share Price ',
//                               content: 'ETB(birr)',
//                               contentPrice: '${share.unitSharePrice}',
//                               title2: 'Number of buyers',
//                               content2: '${share.maximumNumberOfBuyer}',
//                               contentPrice2: '${share.minimumNumberOfBuyer}',
//                             ),
//                             ShareDetailElementWidget(
//                               title1: 'number of shares',
//                               content: '${share.noOfShares}',
//                               contentPrice: '200 units',
//                               title2: 'Divident  ',
//                               content2: '${share.divident}',
//                               contentPrice2: '${share.bankInformation}',
//                             ),
//                             ShareDetailElementWidget(
//                               title1: 'minimum payment ',
//                               content: '${share.minimumPaymentInPercent}',
//                               contentPrice: 'half of the share price',
//                               title2: 'number of share to buy ',
//                               content2: '${share.maximumNumberOfSharesToBuy}',
//                               contentPrice2:
//                                   '${share.minimumNumberOfSharesToBuy}',
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Icon(
//                               Iconsax.tick_circle,
//                               // color: Colors.black,
//                               size: 14,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Container(
//                               width: 550,
//                               child: Text(
//                                 share.proclamationNumber,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Icon(
//                               Iconsax.tick_circle,
//                               // color: Colors.black,
//                               size: 14,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Container(
//                               width: 550,
//                               child: const Text(
//                                 "saving account",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const Icon(
//                               Iconsax.arrow_down_14,
//                               color: Colors.blue,
//                               size: 20,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Icon(
//                               Iconsax.tick_circle,
//                               // color: Colors.black,
//                               size: 12,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Container(
//                               width: 550,
//                               child: const Text(
//                                 "requirment",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const Icon(
//                               Iconsax.arrow_down_14,
//                               color: Colors.blue,
//                               size: 20,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Icon(
//                               Iconsax.tick_circle,
//                               // color: Colors.black,
//                               size: 12,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             Container(
//                               width: 550,
//                               child: const Text(
//                                 "time to return remain payment",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const Icon(
//                               Iconsax.arrow_down_14,
//                               color: Colors.blue,
//                               size: 20,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ))
//                   ],
//                 ),
//               ),
//             )
//           : SingleChildScrollView(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.all(8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       child: const CircleAvatar(
//                         radius: 45,
//                         backgroundImage:
//                             AssetImage('asset/logo_image/goat.jpg'),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 14,
//                     ),
//                     Container(
//                       child: Text(
//                         company.name,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         const Icon(
//                           Iconsax.location,
//                           color: Colors.grey,
//                           size: 12,
//                         ),
//                         const SizedBox(
//                           width: 3,
//                         ),
//                         Text(
//                           company.locationDescription,
//                           // style: STextTheme.lightTextTheme.bodySmall
//                           //     ?.copyWith(color: Colors.blue),
//                           style: TextStyle(fontSize: 13, color: Colors.grey),
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         const Icon(
//                           Iconsax.location,
//                           color: Colors.grey,
//                           size: 12,
//                         ),
//                         const SizedBox(
//                           width: 3,
//                         ),
//                         Text(
//                           company.lineOfBusiness,
//                           // style: STextTheme.lightTextTheme.bodySmall
//                           //     ?.copyWith(color: Colors.blue),
//                           style: TextStyle(fontSize: 13, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       child: Text(
//                         share.description,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 5,
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage(share.shareImage[0]))),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         ShareDetailElementWidget(
//                           title1: 'unit Share Price ',
//                           content: 'ETB(birr)',
//                           contentPrice: '${share.unitSharePrice}',
//                           title2: 'Number of buyers',
//                           content2: '${share.maximumNumberOfBuyer}',
//                           contentPrice2: '${share.minimumNumberOfBuyer}',
//                         ),
//                         ShareDetailElementWidget(
//                           title1: 'number of shares',
//                           content: '${share.noOfShares}',
//                           contentPrice: '200 units',
//                           title2: 'Divident  ',
//                           content2: '${share.divident}',
//                           contentPrice2: '${share.bankInformation}',
//                         ),
//                         ShareDetailElementWidget(
//                           title1: 'minimum payment ',
//                           content: '${share.minimumPaymentInPercent}',
//                           contentPrice: 'half of the share price',
//                           title2: 'number of share to buy ',
//                           content2: '${share.maximumNumberOfSharesToBuy}',
//                           contentPrice2: '${share.minimumNumberOfSharesToBuy}',
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Icon(
//                           Iconsax.tick_circle,
//                           // color: Colors.black,
//                           size: 14,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width - 70,
//                           child: Text(
//                             share.proclamationNumber,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Icon(
//                           Iconsax.tick_circle,
//                           // color: Colors.black,
//                           size: 14,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width - 70,
//                           child: const Text(
//                             "saving account",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const Icon(
//                           Iconsax.arrow_down_14,
//                           color: Colors.blue,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Icon(
//                           Iconsax.tick_circle,
//                           // color: Colors.black,
//                           size: 12,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width - 70,
//                           child: const Text(
//                             "requirment",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const Icon(
//                           Iconsax.arrow_down_14,
//                           color: Colors.blue,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Icon(
//                           Iconsax.tick_circle,
//                           // color: Colors.black,
//                           size: 12,
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width - 70,
//                           child: const Text(
//                             "time to return remain payment",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const Icon(
//                           Iconsax.arrow_down_14,
//                           color: Colors.blue,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     // LineChartgraph(),
//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 40,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(3)),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: ((context) => Purchase())));
//                               },
//                               child: const Center(
//                                 child: Text("BUY",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 15)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }






