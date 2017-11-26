require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
    raise "There are no flying planes" if plane.flying? == false
    plane.state = false
    @airport << plane
  end

  def take_off(weather)
    raise "There are no planes available" if @airport.empty?
    raise "Cannot take off when stormy" if weather.stormy? == true
    plane = @airport.pop
    plane.state = true
    "The plane #{plane} has left the airport"
  end
end
