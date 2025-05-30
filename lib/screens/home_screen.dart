import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/block/weather_bloc/block_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return Image.asset('assetss/1.png', height: 280);
    } else if (code >= 300 && code < 400) {
      return Image.asset('assetss/2.png', height: 280);
    } else if (code >= 400 && code < 500) {
      return Image.asset('assetss/3.png', height: 280);
    } else if (code >= 500 && code < 600) {
      return Image.asset('assetss/4.png', height: 280);
    } else if (code >= 600 && code <= 700) {
      return Image.asset('assetss/5.png', height: 280);
    } else if (code >= 700 && code < 800) {
      return Image.asset('assetss/6.png', height: 280);
    } else if (code >= 800 && code < 900) {
      return Image.asset('assetss/7.png', height: 280);
    } else {
      return Icon(Icons.error, color: Colors.white, size: 100); // Fallback icon
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(18, 1.2 * kToolbarHeight, 18, 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(3, -0.2),
                  child: Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: Alignment(-3, -0.2),
                  child: Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -1.2),
                  child: Container(
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(color: Color(0xFFFFAB40)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<BlockBloc, BlockState>(
                  builder: (context, state) {
                    if (state is Blocksucsecs) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📍 ${state.cityName}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Good Morning',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30),
                            ),
                            Center(
                              child: getWeatherIcon(
                                  state.weather.weatherConditionCode!),
                            ),
                            Center(
                              child: Text(
                                '${state.weather.temperature!.celsius!.round()}ºC',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 45),
                              ),
                            ),
                            Center(
                              child: Text(
                                state.weather.weatherDescription!.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${DateFormat('EEEE dd ').add_jm().format(state.weather.date!)}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assetss/11.png',
                                        scale: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'sunrise',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            DateFormat('hh:mm a')
                                                .format(state.weather.sunrise!),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assetss/12.png',
                                        scale: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'sunset',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            DateFormat('hh:mm a')
                                                .format(state.weather.sunset!),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assetss/13.png',
                                        scale: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Temp Max',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            '${state.weather.tempMax!.celsius!.round()}ºC',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assetss/14.png',
                                        scale: 8,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Temp Min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            '${state.weather.tempMin!.celsius!.round()}ºC',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                          child: Center(
                        child: Text('an eroor occured'),
                      ));
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
