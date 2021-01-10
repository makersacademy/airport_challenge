class Weather

def stormy?
  random_weather == :stormy
end



OUTLOOKS = [:stormy, :sunny, :sunny, :sunny]

def random_weather
  OUTLOOKS.sample
end


end
