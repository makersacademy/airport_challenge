class Weather

#responsible fo determining the weather   

def initialize(windspeed = rand(10))
  @windspeed = windspeed
end

def stormy?
  @windspeed > 7
end

end
