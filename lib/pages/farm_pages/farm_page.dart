import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:masl_futa_agric/pages/farm_pages/add_farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/bloc/bloc/farm_bloc_bloc.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_details_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';

class FarmPage extends StatelessWidget {
  final Farm farm ;

  FarmPage({Key? key, required this.farm}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Farm farm = Farm(
    //   name: 'Farm Name',temperature: 25, weatherCondition: WeatherCondition.sunny,
    // );

   //BlocProvider.of<FarmListBloc>(context).add(FetchFarms());  

    return  BlocBuilder<FarmListBloc, FarmListState>(
        builder: (context, state) {
          if (state is EmptyFarmListState) {
            return const EmptyFarmListPage();
          } else if (state is NonEmptyFarmListState) {
            return FarmListPage(farms: state.farms);
          } else {
            return loadingFarmListPage();
          }
        },
      );
   
  }
}


  class EmptyFarmListPage extends StatelessWidget {
  const EmptyFarmListPage({super.key});
     @override
      Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(    
          children: [
             Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          const Text('Farms', style: TextStyle(fontSize:20, fontWeight:FontWeight.w700, color: Color(0xFF4C586F),),),
           IconButton(
             icon: const Icon(Icons.add),
             onPressed: () {
               // Navigate to the page for adding new farms
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => AddFarmPage()),
               );
             },
           ),
         ],
         ),
            Image.asset('assets/images/peasant tools.png'),
           const Text('No farm added yet, press the add button in the top right corner to add a new task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Color(0xFF7988A4))),
          ],
        ),
      ),
    );
    
     
   
      }
  }



  Widget loadingFarmListPage() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }


class FarmListPage extends StatelessWidget {
  const FarmListPage({
    super.key,
    required this.farms,
  });

   final List <Farm> farms;

  @override
  Widget build(BuildContext context) {
     final Box<Farm> farmBox = Hive.box<Farm>('farmBox');
    List<Farm> farms = farmBox.values.toList();
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(          
          children: [
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        const Text('Farms', style: TextStyle(fontSize:20, fontWeight:FontWeight.w700, color: Color(0xFF4C586F),),),
         IconButton(
           icon: const Icon(Icons.add),
           onPressed: () {
             // Navigate to the page for adding new farms
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => AddFarmPage()),
             );
           },
         ),
       ],
     ),
   const  SizedBox(height: 20),
     Expanded(
       child: ListView.builder(
         itemCount: 5,
         itemBuilder: (context, index) {
           return GestureDetector(
             onTap: () {
               // Navigate to the full view of the farm
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => FullFarmViewPage(farms[index])),
               );
             },
             child: Container(
               margin:const EdgeInsets.symmetric(vertical: 10),
               padding:const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color:const Color(0xFFF0F4CD),
                 borderRadius: BorderRadius.circular(8),
                 border: Border.all(color: const Color(0xFF011F14)),
               ),
               child: const  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Farm Name',
                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF026742)),
                       ),
                       Text(
                         'Farm Location',
                         style: TextStyle(fontSize: 12, color: Color(0xFF026742)),
                       )
                     ],
                   ),
                   Icon(Icons.arrow_forward_ios, size: 12,color:  Color(0xFF026742),),
                 ],
               ),
             ),
           );
         },
       ),
     ),
          ],
        ),
      );
  }
}
