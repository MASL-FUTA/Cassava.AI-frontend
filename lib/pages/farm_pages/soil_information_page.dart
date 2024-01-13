import 'package:flutter/material.dart';
import 'package:masl_futa_agric/pages/farm_pages/soil_properties_page.dart';

class SoilInformationPage extends StatefulWidget {
  @override
  State<SoilInformationPage> createState() => _SoilInformationPageState();
}

class _SoilInformationPageState extends State<SoilInformationPage> {
  String selectedSoil = 'Loamy soil';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soil Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Soil Information',style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700,
            color: Color(0xff4C586F)
          ),),
         const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Soil pH', 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              ),
            ),
          const  SizedBox(height: 20,),
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
      value: selectedSoil,  
      icon: const Icon(Icons.arrow_drop_down),    
      iconSize: 20,   
      elevation: 16,    
      style: const TextStyle(color: Colors.black),    
      
      onChanged: (String? newValue) {
        setState(() {
               selectedSoil = newValue ?? selectedSoil;     
        });
          },    
      items: <String>['Loamy soil', 'Sandy soil', 'clay soil']    
        .map<DropdownMenuItem<String>>((String value) {    
          return DropdownMenuItem<String>(    
            value: value,    
            child: Text(value),    
          );    
        }).toList(),    
    ),
  ),
),

const SizedBox(height: 20,),
  
            // Other text fields as per your requirements
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SoilPropertyPage()));
               },
              child: const Text('Proceed', style: TextStyle(color: Colors.white),), // Added child to ElevatedButton
            ),),],),),);
    
  }
}