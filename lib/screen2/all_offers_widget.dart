import 'package:flutter/material.dart';
import '../constants.dart';
import 'exp_widget.dart';
import 'poster_screen.dart';
import 'screen2main.dart';

class AllOffersWidget extends StatelessWidget {
  const AllOffersWidget({
    super.key,
    required this.widget,
    required this.OfferData,
    required this.expList,
  });

  final screen2 widget;
  final List OfferData;
  final List expList;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 30, top: 10),
        margin: const EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 20),
        decoration: kContainerStyle,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                'All Offers in ${widget.disctName}',
                style: kTextHeadingStyle,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 20,
              spacing: 9,
              children: [
                for (var data in OfferData)
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PosterScreen(
                            disctName: widget.disctName,
                            imageLink: data["pages"],
                            //shopName: data["shopname"],
                            //groupName:data["groupname"],
                            //shopAddress : data["shopaddress"],
                            //offerName: data["name"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: kContainerStyle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                      decoration: kPageCountTagStyle,
                                      width: 60,
                                      height: 30,
                                      child: Center(
                                          child: Text(
                                        "${data["offerCount"]} Pages",
                                        style: const TextStyle(
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      )),
                                    )),
                                //TODO:need to solve this problem
                                Positioned(
                                    top: 200,
                                    left: 80,
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
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
                    ),
                  ),
                for (var data in expList)
                  ExpWidget(data: data)
              ],
            ),
          ],
        ));
  }
}