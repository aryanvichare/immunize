import 'package:flutter/material.dart';
import 'package:immunize/utils/constants.dart';
import 'package:immunize/utils/hex_color.dart';

class VaccineCard extends StatelessWidget {
  String hospitalName, hospitalImage, location, distance;

  VaccineCard({
    @required this.hospitalName,
    @required this.hospitalImage,
    @required this.location,
    @required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: kGutterSmall),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 19.0, 14.0, 30.0),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      width: 75.0,
                      height: 75.0,
                      image: AssetImage('assets/images/$hospitalImage'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              hospitalName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              location,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: HexColor(kPrimaryColor),
                              ),
                              Text(distance)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: -25.0,
                  right: 0.0,
                  child: FlatButton(
                    onPressed: () {
                      print('pressed');
                    },
                    color: HexColor(kPrimaryColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
