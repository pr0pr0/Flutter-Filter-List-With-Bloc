import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/models/Rivals.dart';
import 'package:travel/screens/Rivals.dart';
import 'package:travel/widgets/Fliter/CustomCityFilter.dart';
import 'package:travel/widgets/Fliter/CustomRivalsFilter.dart';

import '../../Bloc/RivalsFilter/rivals_filter_bloc.dart';

class FilterDialog extends StatelessWidget {
  final String title;
  FilterDialog({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const defaultHorizontalPadding = 50.0;
    const defaultVerticalPadding = 35.0;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
            vertical: defaultVerticalPadding * 2,
            horizontal: width > (width + defaultHorizontalPadding * 2)
                ? (width - width) / 2
                : defaultHorizontalPadding),
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filters',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      textDirection: TextDirection.ltr,
                    ),
                    iconSize: 30.0,
                    color: Colors.grey.shade800,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        color: Color.fromARGB(255, 163, 163, 163),
                        height: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 12),
                      child: Text(
                        'الخصم',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(226, 8, 163, 147)),
                      ),
                    ),
                    CustomRivalsFilter(),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 40, left: 40, bottom: 20, top: 10),
                      child: const Divider(
                        color: Color.fromARGB(255, 163, 163, 163),
                        height: 3,
                      ),
                    ),
                    CustomCityFilter(),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 40, left: 40, bottom: 20, top: 10),
                      child: const Divider(
                        color: Color.fromARGB(255, 163, 163, 163),
                        height: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: BlocBuilder<RivalsFilterBloc, RivalsFilterState>(
                builder: (context, state) {
                  if (state is RivalsFiltersLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            var rivals = state.filter.rivalsFilter
                                .where((element) => element.value)
                                .map((e) => e.rivals)
                                .toList();

                            var cities = state.filter.cityFilter
                                .where((element) => element.value)
                                .map((e) => e.city)
                                .toList();

                            List<Rival> listRival = rival;
                                
                            if (rivals.isNotEmpty) {
                              listRival = listRival
                                  .where(
                                    (element) =>
                                        rivals.any((e) => element.rivals == e),
                                  )
                                  .toList();
                            }
                            if (cities.isNotEmpty) {
                              listRival = listRival
                                  .where(
                                    (element) =>
                                        cities.any((e) => element.city == e),
                                  )
                                  .toList();
                            }

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (c) => Rivals(
                                        title: title,
                                        rivals: listRival,
                                      )),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(226, 8, 163, 147),
                            ),
                            child: Text(
                              "متابعة",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            state.filter.rivalsFilter.forEach((element) {
                              context.read<RivalsFilterBloc>().add(
                                    RivalsFilterUpdate(
                                      rivalsFilter:
                                          element.copyWith(value: false),
                                    ),
                                  );
                            });

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (c) => Rivals(
                                        title: title,
                                        rivals: rival,
                                      )),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(226, 8, 163, 147),
                            ),
                            child: Text(
                              "تهيئة",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text('هناك خط'),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
