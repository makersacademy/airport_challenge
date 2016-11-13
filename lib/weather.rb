class Weather

def weather_effect
  random_number = rand(3)
  if random_number <= 1
    "stormy"
  else
    "not stormy"
  end
end

end
