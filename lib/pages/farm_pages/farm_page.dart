import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/add_farm_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/farm_details_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/model/farm_model.dart';

class FarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Farm farm = Farm(
      name: 'Farm Name',

  
       temperature: 25, weatherCondition: WeatherCondition.sunny,
    );
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Farms', style: TextStyle(fontSize:20, fontWeight:FontWeight.w700, color: Color(0xFF4C586F),),),
                IconButton(
                  icon: Icon(Icons.add),
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
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the full view of the farm
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FullFarmViewPage(farm)),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFF0F4CD),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF011F14)),
                      ),
                      child: Row(
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
      ),
    );
  }
}
