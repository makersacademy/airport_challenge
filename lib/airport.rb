require_relative 'plane'
# require_relative 'weather'

class Airport
  attr_reader :hanger
  attr_accessor :capacity
  DEFAULT_CAPACITY = 1 
  # today_weather = Weather.new.weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = Array.new
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full cannot land' unless @hanger.length < @capacity
    @hanger.push(plane)
  end

  def take_off(plane)
    # fail 'Stormy - Cannot takeoff' unless today_weather == 'stormy'
    @hanger.delete(plane)
    print "#{plane} has left #{self}"
  end

end
