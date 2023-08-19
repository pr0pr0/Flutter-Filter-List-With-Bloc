import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel/models/Rivals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/screens/QR_Scanner.dart';
import 'package:travel/widgets/QRDialog.dart';

class Details_screen extends StatefulWidget {
  final Rival sliderShow;

  const Details_screen({super.key, required this.sliderShow});

  @override
  _Details_screenState createState() => _Details_screenState();
}

class _Details_screenState extends State<Details_screen> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
              backgroundColor: Color.fromARGB(255, 200, 228, 236),
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 300,
              flexibleSpace: LayoutBuilder(
                builder: (ctx, cons) {
                  top = cons.biggest.height;
                  return FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 0),
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 250),
                      opacity: top <= 150 ? 1.0 : 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              iconSize: 30.0,
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    background: Container(
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Hero(
                              tag: widget.sliderShow.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image(
                                  image: AssetImage(widget.sliderShow.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 250),
                              opacity: top <= 150 ? 0.0 : 1.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 30.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    textDirection: TextDirection.ltr,
                                  ),
                                  iconSize: 30.0,
                                  color: Colors.black,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20.0,
                            bottom: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.sliderShow.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(226, 8, 163, 147),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'الخصم :',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        widget.sliderShow.rivals.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 20.0,
                            bottom: 20.0,
                            child: Icon(
                              FontAwesomeIcons.heart,
                              color: Color.fromARGB(226, 8, 163, 147),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        'مدينة :',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.sliderShow.city,
                        style: TextStyle(
                          color: Color.fromARGB(226, 8, 163, 147),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('⭐'),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade500),
                              )
                            ],
                          ),
                          Text(
                            '10 reviews',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          )
                        ],
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Divider(
                    color: Color.fromARGB(255, 163, 163, 163),
                    height: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Text(
                    'التفاصيل',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Column(
                    children: [
                      for (int i = 0; i <= 0; i++)
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.circleDot,
                              size: 18,
                              color: Color.fromARGB(226, 8, 163, 147),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'يشمل العرض جميع الغرف',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                const Divider(
                  color: Color.fromARGB(255, 163, 163, 163),
                  height: 3,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.qr_code_scanner),
                          iconSize: 35.0,
                          color: Colors.grey.shade700,
                          onPressed: () =>
                              Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return QR_Scanner();
                            },
                          )),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(100, 3, 133, 121),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "SAH10",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                QRdialog();
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.grey.shade500)),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.qr_code,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Future<void> QRdialog() async {
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => QRDialog(),
      ),
    );
    if (mounted) setState(() {});
  }
}
