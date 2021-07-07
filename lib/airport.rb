require_relative 'plane.rb'
require_relative 'weather.rb'


class Airport

  include Weather
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    raise "Plane is unable to land due to weather conditions" if stormy?
    raise "Airport is full" if full?
    @airport << plane
  end

  def take_off(plane)
    raise "Plane is unable to take off due to weather conditions" if stormy?

    @airport.pop ? "Plane is no longer at the airport" : nil
  end

  private

  def full?
    @airport.length >= @capacity
  end

end
