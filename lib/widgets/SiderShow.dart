
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel/models/destination_model.dart';

class SiderShow extends StatefulWidget {
  @override
  State<SiderShow> createState() => _SiderShowState();
}

final CarouselController _carouselController = CarouselController();
int _currentPage = 0;

class _SiderShowState extends State<SiderShow> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (sliderShow.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              //height: 210.0,
              autoPlay: true,
              viewportFraction: 1,
              aspectRatio: 2,
              onPageChanged: (index, reason) {
                _currentPage = index;
              },
              scrollPhysics: const BouncingScrollPhysics(),
            ),
            items: sliderShow.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CaredAdviceView(sliderShow[_currentPage]);
                },
              );
            }).toList(),
          ),
          /*
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              
            child: SmoothPageIndicator(
              controller: _PageController,
              count: sliderShow.length,
              effect: WormEffect(
                dotWidth: 14,
                dotHeight: 14,
                dotColor: Colors.grey.shade400,
                activeDotColor: Color.fromARGB(226, 8, 163, 147),
                paintStyle: PaintingStyle.stroke,
              ),
            ),
            
            ),
          ),
          */
        ],
      );
    } else {
      return Container();
    }
  }

  Widget CaredAdviceView(SliderShow sliderShow) {
    return Center(
      child: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade400, width: 0.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: AssetImage(sliderShow.imageUrl),
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -20,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(155, 215, 215, 215),
                        spreadRadius: 4,
                        blurRadius: 6,
                      )
                    ],
                    borderRadius: BorderRadius.circular(14),
                    color: Color.fromARGB(220, 255, 255, 255),
                  ),
                  margin: EdgeInsets.only(left: 8, right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        sliderShow.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        sliderShow.description,
                        style: TextStyle(fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 25,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical:4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(226, 8, 163, 147),
                  ),
                  child: Text(
                    'VNB33N',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
