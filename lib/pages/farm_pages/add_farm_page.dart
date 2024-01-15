import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_information_page.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_properties_page.dart';

class AddFarmPage extends StatefulWidget {
  @override
  State<AddFarmPage> createState() => _AddFarmPageState();
}

class _AddFarmPageState extends State<AddFarmPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Column(
          
          children: [
             PageIndicator(pageCount: 3, currentPage: currentPage),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });},
                children: [
                 
                  // Page 1
                  AddFarmPage1(),
                  // Page 2
                  SoilInformationPage(),
                  //Page 3
                  SoilPropertyPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  PageIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(pageCount, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            height: 7.0,
              width: 79.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              
              color: index == currentPage ? Color(0xffE7EEB0) : Color(0xff026742),
            ),
          );
        }),
      ),
    );
  }
}


class AddFarmPage1 extends StatefulWidget {
  @override
  State<AddFarmPage1> createState() => _AddFarmPage1State();
}

class _AddFarmPage1State extends State<AddFarmPage1> {
String selectedUnit = 'Plots';
    String selectedStage = 'Planting Stage';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        title: Text('Add New Farm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Center(
              child:  Text('Add New Farm', style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700,
                color: Color(0xff4C586F)
              ),),
            ),
           const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Farm Name',
              labelStyle:const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400,
                color: Color(0xff7988A4)
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: const Color(0xffF7F8F9),
              ),
              ),
               const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Farm Location', labelStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400,
                color: Color(0xff7988A4)
              ), border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              
              fillColor:const Color(0xffF7F8F9),
              ),
            ),
           const SizedBox(height: 20),
            Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
      Expanded(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Farm Size ?',
            labelStyle: const TextStyle(
              fontSize: 14, 
              fontWeight: FontWeight.w400,
              color: Color(0xff7988A4)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: const Color(0xffF7F8F9),
          ),
         
        ),
      ),
       const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text('Unit', style:TextStyle( fontWeight: FontWeight.w400,
                color: Color(0xff7988A4),fontSize: 14) ),
            Row(
              children: <Widget>[
             GestureDetector(
      onTap: () {
      setState(() {
        selectedUnit = 'Plots';
      });
      },
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: selectedUnit == 'Plots' ? Color(0xff026742) : Color(0xffF7F8F9),
      ),
      child: Text(
        'Plots',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: selectedUnit == 'Plots' ? Colors.white : Color(0xff026742),
        ),
      ),
      ),
    ),
    GestureDetector(
      onTap: () {
      setState(() {
        selectedUnit = 'Acres';
      });
      },
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: selectedUnit == 'Acres' ? Color(0xff026742) : Color(0xffF7F8F9),
      ),
      child: Text(
        'Acres',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: selectedUnit == 'Acres' ? Colors.white : Color(0xff026742),
        ),
      ),
      ),
    ),
    GestureDetector(
      onTap: () {
      setState(() {
        selectedUnit = 'Hectares';
      });
      },
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: selectedUnit == 'Hectares' ? Color(0xff026742) : Color(0xffF7F8F9),
      ),
      child: Text(
        'Hectares',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: selectedUnit == 'Hectares' ? Colors.white : Color(0xff026742),
        ),
      ),
      ),
    ),
              ],
            ),
          ],
        ),
      ),
      ],
    ),
    const SizedBox(height: 20),
    
    Container(
      width: 331,
      height: 56,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color(0xffE8ECF4),
      ),
      color: const Color(0xffF7F8F9),
      ),
      child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedStage,  
        icon: const Icon(Icons.arrow_drop_down),    
        iconSize: 20,   
        elevation: 16,    
        style: const TextStyle(color: Colors.black),    
        
        onChanged: (String? newValue) {
          setState(() {
                 selectedStage = newValue ?? selectedStage;     
          });
            },    
        items: <String>['Planting Stage', 'Cultivating Stage', 'Harvesting Stage']    
          .map<DropdownMenuItem<String>>((String value) {    
            return DropdownMenuItem<String>(    
              value: value,    
              child: Text(value),    
            );    
          }).toList(),    
      ),
      ),
    ),
            const SizedBox(height: 32),
            SizedBox(
              width: 331,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff026742),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigate to the next page (Soil Information)
                  // You may want to pass the entered data to the next page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SoilInformationPage()));
                },
                child:const Text('Proceed', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600) ,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

