require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Cannot land plane, this Airport is full." if @hangar.length >= @capacity
    @hangar.push(plane)
  end

  def take_off(plane)
    @hangar.pop
  end

  def random_weather
    weather_options = ["sunny", "sunny", "sunny", "stormy"]
    weather = weather_options.sample
    return weather
  end
end

