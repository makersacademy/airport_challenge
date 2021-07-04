class Weather

 FORECAST = {
   1 => 'sunny',
   2 => 'cloudy',
   3 => 'rainy',
   4 => 'stormy'
 }

 def rand_num
  rand(1..4)
 end

 def weather_conditions
   FORECAST[rand_num]
 end

end