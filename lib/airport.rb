require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  attr_accessor :land
  attr_accessor :take_off
  attr_accessor :weather
end

def land
end

def take_off
end

def weather
  weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny",
              "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]
  weather.sample
end
