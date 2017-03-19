class Weather

def initialize(windspeed = rand(10))
  @windspeed = windspeed
end

def stormy?
  @windspeed > 7
end

end
