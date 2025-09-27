class Aqi {
  final double aqi, temp, humid, press, wind, rain, pm25, pm10;
  final String city; 

  Aqi(this.aqi, this.temp, this.humid, this.press, this.wind, this.rain, this.pm25, this.pm10, this.city);

  Aqi.fromJson(Map<String, dynamic> json)
      : aqi = (json['data']['aqi'] as num).toDouble(),
        temp = (json['data']['iaqi']['t']['v'] as num).toDouble(),
        humid = (json['data']['iaqi']['h']['v'] as num).toDouble(),
        press = (json['data']['iaqi']['p']['v'] as num).toDouble(),
        wind = (json['data']['iaqi']['w']['v'] as num).toDouble(),
        rain = (json['data']['iaqi']['r']['v'] as num).toDouble(),
        pm25 = (json['data']['iaqi']['pm25']['v'] as num).toDouble(),
        pm10 = (json['data']['iaqi']['pm10']['v'] as num).toDouble(),
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