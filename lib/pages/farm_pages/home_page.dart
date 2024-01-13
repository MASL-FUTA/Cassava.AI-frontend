import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/add_farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/dashboard_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:masl_futa_agric/pages/farm_pages/reusable_widgets/farm_weather_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.farms,
  });

  final List<Farm> farms;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text('Hi, Username! 👋', style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xff242A34),
            ),),
            
            Text(DateTime.now().day.toString() + '/' + DateTime.now().month.toString() + '/' + DateTime.now().year.toString()),
           const SizedBox(height: 20),

        

CarouselSlider(
  options: CarouselOptions(
    height: 160.0,
    enlargeCenterPage: false,
    autoPlay: true,
    aspectRatio: 16/9,
    autoPlayCurve: Curves.fastOutSlowIn,
    enableInfiniteScroll: true,
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    viewportFraction: 0.5,
  ),
  items: [
    for (int i = 0; i < 5; i++)
    FarmWeatherCard(farm: farms[i]),
  ],
),
            //FarmWeatherCard(farm: farm1,),
           const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 270,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff026742),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the Add Farm page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddFarmPage()));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon( Icons.add, color: Colors.white,),
                      Text('Add New Farm', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
            ),
           const SizedBox(height: 48),
            TasksCard(),
          ],
        ),
      ),
    );
  }
}
