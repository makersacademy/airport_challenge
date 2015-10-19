module Weather

def stormy?
  weather_randomizer? <= 2 ? true : false
end

def weather_randomizer?
  rand(10)
end

end
