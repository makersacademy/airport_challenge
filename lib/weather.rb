class Weather

def weather_conditions
  [:sunny, :sunny, :sunny, :stormy]
end

def stormy?
  weather_conditions.sample == :stormy
end

end
