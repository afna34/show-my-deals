import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hi"),
      ),
    );
  }
}

//offer group offer ano allenn nokaan : offers.isShop,offers.
//store group ano shop ano ariyan : shops.isGroup,shops.isShop

// import 'package:flutter/material.dart';
//
// class LoadingScreen extends StatefulWidget {
//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     getLocationData();
//   }
//
//   void getLocationData() async {
//
//     var weatherData = await WeatherModel().getLocationWeather();
//
//     Navigator.push(context, MaterialPageRoute(builder: (context){ return LocationScreen(locationWeather: weatherData,);}));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SpinKitWanderingCubes(
//           color: Colors.white,
//           size: 50.0,
//         ),
//       ),
//     );
//   }
// }
