
import 'package:flutter/material.dart';

import '../constants.dart';

class ExpWidget extends StatelessWidget {
  ExpWidget({
    super.key,
    required this.data,
  });
  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kContainerStyle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: kContainerStyle,
            child: Column(
              children: [
                SizedBox(
                  width: 155,
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    data["thumbnail"]["url"],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: 155,
                              height: 180,
                            ),
                          )),
                      Positioned(
                          top: 10,
                          right: 0,
                          child: Container(
                            decoration: kExpPageCountStyle,
                            width: 60,
                            height: 30,
                            child: const Center(
                                child: Text(
                                  "Expired",
                                  style:
                                  TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )),
                          )),
                      Positioned(
                          top: 200,
                          left: 80,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Image.network(
                                data["logo"],
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            decoration: kTopCornerCurvedContainer,
            height: 20,
            child: Text(
              '${data["viewCount"]} Views',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
