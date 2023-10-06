class WeatherModel{
  final String? cityName;
  final String? country;
  final String? date;
  final String? image;
  final double? maxTemp;
  final double? minTemp;
  final double? avgTemp;
  final String? status;

  WeatherModel(
      {this.image,this.country, this.cityName, this.date, this.maxTemp, this.minTemp, this.avgTemp, this.status});

  factory WeatherModel.fromJson(Map<String,dynamic> json){
    return WeatherModel(
      cityName:json['location']['name'] ,
      country: json['location']['country'],
      date:json['location']['localtime'] ,
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      status:json['forecast']['forecastday'][0]['day']['condition']['text'] ,
      image: json['forecast']['forecastday'][0]['day']['condition']['icon']
    );

  }

}