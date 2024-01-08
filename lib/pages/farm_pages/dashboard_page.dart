import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/add_farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:masl_futa_agric/pages/farm_pages/reusable_widgets/farm_weather_card.dart';
 import 'package:carousel_slider/carousel_slider.dart';


class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final farm1 = Farm(name: 'Farm 1', temperature: 25,  weatherCondition: WeatherCondition.rainy);
    List<Farm> farms =[Farm(name: 'Farm 1', temperature: 25,  weatherCondition: WeatherCondition.rainy), 
    Farm(name: 'Farm 2', temperature: 25,  weatherCondition: WeatherCondition.sunny),
    Farm(name: 'Farm 3', temperature: 25,  weatherCondition: WeatherCondition.windy),
    Farm(name: 'Farm 4', temperature: 25,  weatherCondition: WeatherCondition.rainy),
    Farm(name: 'Farm 5', temperature: 25,  weatherCondition: WeatherCondition.sunny),];
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        leading: Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.agriculture_outlined,), label: 'Farms'),
          BottomNavigationBarItem(icon: Icon(Icons.folder, ), label: 'Resources'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz, ), label: 'More'),
        ],
         selectedItemColor: const Color(0xff026742), 
  unselectedItemColor: const Color(0xff7988A4), 
  selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold), 
  unselectedLabelStyle:const TextStyle(fontWeight: FontWeight.normal), 

      ),
    );
  }
}





class TasksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your tasks card UI here
    return Container(
      // Placeholder container, customize as needed
      height: 150,
      color: Colors.orange,
      child: Center(
        child: Text('Tasks Card'),
      ),
    );
  }
}
