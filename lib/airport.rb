require_relative 'plane.rb'
require_relative 'weather.rb'


class Airport

  include Weather

  def initialize

    @airport = []
  end

  def land(plane)
    raise StandardError, "Plane is unable to land due to weather conditions" if stormy?
    @airport << plane
  end

  def take_off(plane)
    raise StandardError, "Plane is unable to take off due to weather conditions" if stormy?
    @airport.pop ? "Plane is no longer at the airport" : nil
  end

end
