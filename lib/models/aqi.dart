class Aqi {
  final int aqi;
  final double temp, humid, press, wind, rain, pm25, pm10;
  final String city; 

  Aqi(this.aqi, this.temp, this.humid, this.press, this.wind, this.rain, this.pm25, this.pm10, this.city);

  Aqi.fromJson(Map<String, dynamic> json)
      : aqi = json['data']['aqi'],
        temp = json['data']['iaqi']['t']['v'],
        humid = json['data']['iaqi']['h']['v'],
        press = json['data']['iaqi']['p']['v'],
        wind = json['data']['iaqi']['w']['v'],
        rain = json['data']['iaqi']['r']['v'],
        pm25 = json['data']['iaqi']['pm25']['v'],
        pm10 = json['data']['iaqi']['pm10']['v'],
        city = json['data']['city']['name'];

  Map<String, dynamic> toJson() {
    return {
      'aqi': aqi,
      'temp': temp,
      'humid': humid,
      'press': press,
      'wind': wind,
      'rain': rain,
      'pm25': pm25,
      'pm10': pm10,
      'city': city,
    };
  }
}