 class Weather
   def stormy?
     generate_weather
   end

   def generate_weather
     rand(5) == 1 ? true : false
   end
end
