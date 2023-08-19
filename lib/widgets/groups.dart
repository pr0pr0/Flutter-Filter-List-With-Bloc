import 'package:flutter/material.dart';
import 'package:travel/models/Group.dart';
import 'package:travel/models/Rivals.dart';
import 'package:travel/screens/Rivals.dart';

class groups extends StatelessWidget {
  const groups({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'المجموعات',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: group.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1, crossAxisSpacing: 1),
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              padding: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.8, 1.0),
                      blurRadius: 0.2,
                    )
                  ]),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Rivals(
                          title: group[index].title,
                          rivals: rival,
                        );
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image(
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              image: AssetImage(group[index].imageUrl))),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      group[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
