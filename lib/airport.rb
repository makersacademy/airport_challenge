require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  include Weather
  attr_accessor :planes
  attr_reader :capacity


  DEFAULT_CAPACTITY = 20

  def initialize(capacity=DEFAULT_CAPACTITY)

    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'plane already in the airport' if planes.include?(plane)
    fail "weather too stormy to land" if weather == :stormy
    fail "airport at max capacity" if at_capacity?
     planes << plane
  end

  def take_off(plane)
    fail "weather is stormy" if weather == :stormy
    planes.pop
  end

  private


  def at_capacity?
      planes.count == @capacity
  end

end