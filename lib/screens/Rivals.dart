// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/models/Rivals.dart';
import 'package:travel/screens/Details_screen.dart';
import 'package:travel/screens/home_screen.dart';

import 'package:travel/widgets/Fliter/FilterDialog.dart';

class Rivals extends StatefulWidget {
  final String title;
  final List<dynamic> rivals;

  const Rivals({super.key, required this.title, required this.rivals});

  @override
  State<Rivals> createState() => _RivalsState();
}

class _RivalsState extends State<Rivals> {
  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(
      '$rating $stars',
      style: TextStyle(color: Colors.grey.shade700),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfff8f9ff),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                //  color: Color.fromARGB(226, 8, 163, 147),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(FontAwesomeIcons.sortAmountDown),
                                iconSize: 28.0,
                                color: Colors.grey.shade700,
                                onPressed: () {
                                  QrDialog(widget.title);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.search),
                                iconSize: 28.0,
                                color: Colors.grey.shade700,
                                onPressed: () => {},
                              ),
                            ],
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 62, 62, 62),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.transparent,
                                size: 28,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  textDirection: TextDirection.ltr,
                                ),
                                iconSize: 30.0,
                                color: Colors.grey.shade700,
                                onPressed: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context){
                                      return HomeScreen();
                                    })),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 163, 163, 163),
                      height: 3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: MasonryGridView.builder(
                  mainAxisSpacing: 2,
                  // crossAxisSpacing :2,
                  itemCount: widget.rivals.length,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Details_screen(
                                sliderShow: widget.rivals[index],
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 0.1,
                            ),
                          ],
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        height: (widget.rivals[index].rivals) * 5 + 100.0,
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Image(
                                    height:
                                        widget.rivals[index].rivals * 5 + 40.0,
                                    width: MediaQuery.of(context).size.width,
                                    image: AssetImage(
                                        widget.rivals[index].imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: -15,
                                  left: 10,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color.fromARGB(226, 8, 163, 147),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'الخصم :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                            '${widget.rivals[index].rivals.toString()}%',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, top: 14),
                                  child: Text(
                                    widget.rivals[index].name,
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Center(
                                  child: _buildRatingStars(
                                      widget.rivals[index].rating),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> QrDialog(String title ) async {
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => FilterDialog( title: title,),
      ),
    );
    if (mounted) setState(() {});
  }
}
