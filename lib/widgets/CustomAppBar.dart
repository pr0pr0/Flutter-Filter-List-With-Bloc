import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(this.select, this.fromRivals);
  String select;
  bool fromRivals;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      //  color: Color.fromARGB(226, 8, 163, 147),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 10,
              ),
              fromRivals
                  ? Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.grey.shade700,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.grey.shade700,
                          onPressed: () => {},
                        ),
                      ],
                    )
                  : Icon(
                      Icons.search_sharp,
                      size: 35,
                      color: Colors.transparent,
                    ),
              fromRivals
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width / 5.8,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width / 3.4,
                    ),
              Text(
                select,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 62, 62, 62),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
              ), //
              fromRivals
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          textDirection: TextDirection.ltr,
                        ),
                        iconSize: 30.0,
                        color: Colors.grey.shade700,
                        onPressed: () => Navigator.pop(context),
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.menu,
                        textDirection: TextDirection.ltr,
                      ),
                      iconSize: 30.0,
                      color: Colors.grey.shade700,
                      onPressed: () {},
                    ),
            ],
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
    );
  }
}
