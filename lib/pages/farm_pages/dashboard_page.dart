

import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';
import 'package:masl_futa_agric/pages/farm_pages/more_screen_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/resource_page.dart';
import 'home_page.dart';


class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

     List<Farm> farms =[Farm(name: 'Farm 1', temperature: 25,  weatherCondition: WeatherCondition.rainy), 
    Farm(name: 'Farm 2', temperature: 25,  weatherCondition: WeatherCondition.sunny),
    Farm(name: 'Farm 3', temperature: 25,  weatherCondition: WeatherCondition.windy),
    Farm(name: 'Farm 4', temperature: 25,  weatherCondition: WeatherCondition.rainy),
    Farm(name: 'Farm 5', temperature: 25,  weatherCondition: WeatherCondition.sunny),];

  List<FarmDetails> farmies = [
    FarmDetails()

  ];

 int _currentIndex = 0;
     void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    print('$_currentIndex');
  }

  @override
  Widget build(BuildContext context) {
   // final farm1 = Farm(name: 'Farm 1', temperature: 25,  weatherCondition: WeatherCondition.rainy);
    final List<Widget> children = [
    HomePage(farms: farms),
    FarmPage(farms:farmies[0] ,),
    ResourcesScreen(),
    MoreScreen(),
  ];

   
    return Scaffold(
    
      body:  SafeArea(child: children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
         onTap: onTabTapped,
        currentIndex: _currentIndex,
       
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
