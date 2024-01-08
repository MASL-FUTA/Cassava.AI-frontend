import 'package:flutter/material.dart';

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
          SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Soil pH', 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              ),
            ),
            SizedBox(height: 20,),
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
  
            // Other text fields as per your requirements
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'), // Added child to ElevatedButton
            ),
          ],
        ),
      ),
    );
  }
}