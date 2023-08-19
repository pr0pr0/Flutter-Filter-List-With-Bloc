import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Bloc/RivalsFilter/rivals_filter_bloc.dart';
import 'package:travel/models/Rivals.dart';

class CustomCityFilter extends StatelessWidget {
  const CustomCityFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RivalsFilterBloc, RivalsFilterState>(
      builder: (context, state) {
        if (state is RivalsFilterLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RivalsFiltersLoaded) {
          return Column(
            children: [
              for (int index = 0;
                  index < state.filter.cityFilter.length;
                  index++)
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${state.filter.cityFilter[index].city}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              side: BorderSide(width: 0, style: BorderStyle.none),
                              checkColor: Color.fromARGB(226, 8, 163, 147),
                              activeColor: Colors.transparent,
                              value: state.filter.cityFilter[index].value,
                              onChanged: (bool? newValue) {
                                context
                                    .read<RivalsFilterBloc>()
                                    .add(CityFilterUpdate(
                                      state.filter.cityFilter[index]
                                          .copyWith(value: newValue),
                                    ));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        } else {
          return Center(
            child: Text("هناك خطى"),
          );
        }
      },
    );
  }
}
