import 'package:flutter/material.dart';


class NoWeather extends StatelessWidget {
  const NoWeather({super.key});


  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(

      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/dbc52b49-a10a-4bdd-a7e2-596c376ae304.png')),
            SizedBox(height: 20,),
            Text('Please enter your city or country name in search ',style: TextStyle(
              fontSize: 20
            )),
          ],
        ),
      ),
    );
  }
}
