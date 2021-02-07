import 'package:flutter/material.dart';
import 'package:immunize/utils/constants.dart';
import 'package:immunize/utils/hex_color.dart';
import 'package:immunize/widgets/article_card.dart';
import 'package:immunize/widgets/vaccine_card.dart';

class Homepage extends StatelessWidget {
  static const List<Map<String, String>> HOSPITAL_DATA = [
    {
      'hospitalName': 'Frankfrut University Hospital',
      'hospitalImage': 'hospital-1.png',
      'location': 'Theodor-Stern-Kai 7, 60590',
      'distance': '1.0 km',
    },
    {
      'hospitalName': 'St. Marien-Hospital Berlin',
      'hospitalImage': 'hospital-2.png',
      'location': 'Gallwitzallee 12249 Berlin',
      'distance': '1.2 km',
    }
  ];

  List<VaccineCard> hospitalCards = HOSPITAL_DATA
      .map(
        (hospital) => VaccineCard(
          hospitalName: hospital['hospitalName'],
          hospitalImage: hospital['hospitalImage'],
          location: hospital['location'],
          distance: hospital['distance'],
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            color: HexColor(kPrimaryColor),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Stack(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Image(
                            width: 250.0,
                            image: AssetImage('assets/images/vaccination.png'),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0),
                          child: Container(
                              child: Text(
                            "Better mass \nvaccination",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w800,
                            ),
                          )),
                        )
                      ],
                    ),
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(height: kGutterSmall),
          Padding(
            padding: const EdgeInsets.only(
                left: 1.5 * kGutterSmall, right: 1.5 * kGutterSmall),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vaccines availiable',
                      style: kHeadingStyle,
                    ),
                    Text(
                      'See all',
                      style: kLinkStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: hospitalCards,
                ),
                SizedBox(height: kGutterSmall * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Health Articles',
                      style: kHeadingStyle,
                    ),
                    Text(
                      'See all',
                      style: kLinkStyle,
                    ),
                  ],
                ),
                Column(
                  children: [ArticleCard()],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
