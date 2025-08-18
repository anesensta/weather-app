import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/mydata.dart';

part 'block_event.dart';
part 'block_state.dart';

class BlockBloc extends Bloc<BlockEvent, BlockState> {
  BlockBloc() : super(BlockInitial()) {
    on<fetchweatherr>((event, emit) async {
      emit(Blockloding());
      try {
        // Get Weather
        WeatherFactory wf =
            WeatherFactory(API_KEYY!, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);

        // Reverse Geocoding (Get Address/City)
        List<Placemark> placemarks = await placemarkFromCoordinates(
            event.position.latitude, event.position.longitude);
        String cityName = placemarks[0].locality ?? 'Unknown';

        // Emit Success with weather and city name
        emit(Blocksucsecs(weather, cityName));
      } catch (e) {
        emit(Blockeroor());
        print('Error: $e');
      }
    });
  }
}
