import 'package:flutter/material.dart';

class AddFarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Farm'),
      ),
      body: PageView(
        children: [
          // Page 1
          AddFarmPage1(),
          // Page 2
          SoilInformationPage(),
        ],
      ),
    );
  }
}

class AddFarmPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add New Farm'),
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter Farm Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter Farm Location'),
          ),
          // Other text fields and dropdowns as per your requirements
          ElevatedButton(
            onPressed: () {
              // Navigate to the next page (Soil Information)
              // You may want to pass the entered data to the next page
              Navigator.push(context, MaterialPageRoute(builder: (context) => SoilInformationPage()));
            },
            child: Text('Proceed'),
          ),
        ],
      ),
    );
  }
}

class SoilInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Soil Information'),
          TextFormField(
            decoration: InputDecoration(labelText: 'Soil pH'),
          ),
          // Other text fields as per your requirements
          ElevatedButton(
            onPressed: () {
              // Implement logic to save farm data
              // For simplicity, it navigates back to the Dashboard
              Navigator.pop(context);
            },
            child: Text('Save Farm Data'),
          ),
        ],
      ),
    );
  }
}
