import 'package:flutter/material.dart';

class WeatherLoadedError extends StatelessWidget {
  const WeatherLoadedError({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Icon(Icons.error,size: 35,color: Colors.red,),
          SizedBox(width: 15,),
          Expanded(child: Text('Please enter the right name for your country or city',style: TextStyle(fontSize: 20),)),
        ],
      ),
    );
  }
}
