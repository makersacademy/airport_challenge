class Weather
 attr_reader :stormy
 def stormy?
  weather_randomiser == :stormy
 end


private

 WEATHER_POSSIBILITIES = [:good, :good, :good, :stormy, :good, :good]

 def weather_randomiser
   index = rand(WEATHER_POSSIBILITIES.length-1)
   WEATHER_POSSIBILITIES[index]
 end


end
