class Weather

def bad_weather?
  upper_bound = 100
  good_weather_upper_bound = 90
  number = rand(upper_bound)
  return number > good_weather_upper_bound
end


end
