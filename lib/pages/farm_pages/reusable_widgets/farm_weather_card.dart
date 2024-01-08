import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';

class FarmWeatherCard extends StatelessWidget {
  final Farm farm;

  FarmWeatherCard({required this.farm});

  @override
  Widget build(BuildContext context) {
    return
    farmWeatherContainer(farm: farm);
  }
}

String getWeatherImage(String weatherCondition) {
  switch (weatherCondition) {
    case 'Sunny':
      return 'assets/images/framesunny.png';
      
    case 'Rainy':
      return 'assets/images/framesunny.png';
    // add more cases for other weather conditions
    default:
      return 'assets/images/framesunny.png';
  }
}

class farmWeatherContainer extends StatelessWidget {
  const farmWeatherContainer({
    super.key,
    required this.farm,
  });

  final Farm farm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 153,
     
      decoration: BoxDecoration(
        color: Colors.green,
         
       image: DecorationImage(
      image: AssetImage(getWeatherImage(farm.weatherCondition.name)),
      fit: BoxFit.cover,
        ),
        
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
           const SizedBox(height: 10),
            Text(
              farm.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
           const SizedBox(height: 5),
            Text(
              '${farm.temperature}°C',
              style: TextStyle(fontSize: 36,
              fontWeight: FontWeight.w600,
               color: Color(0xffC8D748)),
            ),
           const SizedBox(height: 5),
            if (farm.weatherCondition == WeatherCondition.sunny)
              Image.asset(
                'assets/images/Sun.png', // Replace with your sunny image asset
                height: 30,
                width: 30,
              ),
            if (farm.weatherCondition == WeatherCondition.rainy)
              Image.asset(
                'assets/images/Rain.png', // Replace with your rainy image asset
                height: 30,
                width: 30,
              ),
              if (farm.weatherCondition == WeatherCondition.windy)
              Image.asset(
                'assets/images/Windy.png', // Replace with your rainy image asset
                height: 30,
                width: 30,
              ),
               const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('More', style: TextStyle(color: Colors.white)),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

