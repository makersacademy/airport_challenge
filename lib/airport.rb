require_relative 'plane'
require_relative 'weather'

class Airport
attr_accessor :capacity
attr_accessor :airborne

DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @airborne = []
  end

  def conditions
    @weather
  end

  def land(plane)
    fail "Too stormy" if conditions == "stormy"
    fail "Airport full" if @planes.count >= 10
    #plane.landed = true
    @planes << plane
  end

  def take_off(planes)
    fail "Too stormy" if conditions == "stormy"
    @planes.each do |plane|
    puts plane
    @airborne << plane
    puts airborne
    end
  end


end
