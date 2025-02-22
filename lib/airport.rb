require 'plane'

class Airport
  attr_accessor :weather
  DEFAULT_CAPACITY = 20
  DEFAULT_WEATHER = nil

  def initialize(x=DEFAULT_CAPACITY)
    @capacity = x
    @airport = []
    @weather = nil
  end

  def check_weather(c=DEFAULT_WEATHER)
      weather = ["sunny", "stormy", "rainy"]
      @weather = c
      if @weather == nil
        @weather = weather[rand(3)]
      end
  end

  def land(plane)
    check_weather
    fail 'Airport full' if full?
    fail 'Conditions unsafe' if @weather == "stormy"
    @airport << plane
  end

  def take_off(plane)
    check_weather
    fail 'Conditions unsafe' if @weather == "stormy"
    @airport.pop
    confirm_takeoff(plane)
  end

  def confirm_takeoff(plane)
     "#{plane} has taken off"
  end

  def full?
    @airport.count >= @capacity
  end

end