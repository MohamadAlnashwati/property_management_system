import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class DtailsScreern extends StatelessWidget {
  List<String> images = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 300.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                ),
                control: const SwiperControl(
                    color: Colors.black87, disableColor: Colors.black),
              )),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Descraption",
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "A property description is the written portion of a real estate listing that describes the details of a home for sale or lease.Descriptions account for roughly one-third of a listing and are accompanied by property information (i.e. the number of bedrooms) and photographs. The goal of a creative property description is to attract home buyers. Listing descriptions need colorful words to paint a clear mental picture of a home’s features and benefits, over and above the accompanying",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
          ),
        ],
      ),
    ));
  }
}
