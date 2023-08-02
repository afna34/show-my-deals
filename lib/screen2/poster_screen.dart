import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../stores_screen/appbar_stores_tags.dart';
import '../widgets/app_bar_buttons.dart';
import '../widgets/customAppBar.dart';


class PosterScreen extends StatelessWidget {
  final String disctName;
  final List<dynamic> imageLink;
  //final String shopName;
 // final String groupName;
 // final String offerName;
  //final String shopAddress;
  PosterScreen(
      {super.key,
      required this.disctName,
      required this.imageLink,
     // required this.shopName,
      //required this.groupName,
      //required this.shopAddress,
        //required this.offerName,
      });

  @override
  Widget build(BuildContext context) {
    CarouselController _carouselController = CarouselController();
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(),
          AppBarButtons(
            screen2name: disctName,
          ),
          const SizedBox(
            height: 15,
          ),
           AppBarStoreTags(disctName: disctName,),
          Container(
              padding: const EdgeInsets.only(
                bottom: 45,
              ),
              margin: const EdgeInsets.only(
                  top: 15, left: 20, right: 20, bottom: 20),
              decoration: kContainerStyle,
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: 350.0, // Adjust the height as per your requirement
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      viewportFraction: 0.9,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: imageLink.map((item) {
                      return Container(
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: 250,
                        height: 350,
                      );
                    }).toList(),
                  ),
                  Text('1/${imageLink.length}'),
                  //Text(shopName),
                  // Text(shopAddress),
                  InkWell(
                    onTap: () {},
                    child: Text('VISIT PROFILE'),
                  ),
                  //Text(offerName),
                ],
              ))
        ],
      ),
    );
  }
}
