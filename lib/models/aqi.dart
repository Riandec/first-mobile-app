class Aqi {
  final int aqi;
  final double temp;
  final String city; 

  Aqi(this.aqi, this.temp, this.city);

  Aqi.fromJson(Map<String, dynamic> json)
      : aqi = json['data']['aqi'],
        temp = json['data']['iaqi']['t']['v'],
        city = json['data']['city']['name'];

  Map<String, dynamic> toJson() {
    return {
      'aqi': aqi,
      'temp': temp,
      'city': city,
    };
  }
}