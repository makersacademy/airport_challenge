class Weather

def generate_weather
  rand(1..6)
end

def stormy?
  if generate_weather == 6
    true

  end
end

end
