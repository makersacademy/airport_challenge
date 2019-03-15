require_relative 'weather'
require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @hangar = []
    @weather = weather
  end

  def land(plane)
    raise "Plane already landed!" if @hangar.include?(plane)
    raise "Cannot land due to stormy weather" if stormy?
    raise "Cannot land - airport full" if full?

    @hangar << plane
    plane.land(self)
  end

  def take_off(plane)
    raise "Plane not in airport" unless @hangar.include?(plane)
    raise "Cannot depart due to stormy weather" if stormy?

    @hangar.delete(plane)
    puts "#{plane} has taken off"
  end

  def stormy?
    @weather.forecast == 'Stormy'
  end

  def full?
    @hangar.count >= @capacity
  end

end
