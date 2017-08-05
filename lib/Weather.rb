class Weather
 attr_reader :stormy
 def stormy?
  weather_possibilities = [:good, :good, :good, :stormy, :good, :good]
  index = rand(weather_possibilities.length-1) # -1  as array indexes start with 0 not 1
  weather_possibilities[index] == :stormy
 end

end
