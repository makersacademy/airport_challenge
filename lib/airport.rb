require 'plane.rb'
require 'weather.rb'

class Airport
  attr_reader :capacity, :sky, :airport
  attr_accessor :planes

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(aeroplane, weather)
    raise "plane not in flight" unless aeroplane.flying == true

    raise "too stormy to land" if weather.stormy == true

    raise "airport is full" if full?

    aeroplane.to_ground
    @planes << aeroplane
    "plane landed"
  end

  def takeoff(aeroplane, weather)
    raise "plane not grounded" if aeroplane.flying == true

    raise "too stormy to take off" if weather.stormy == true

    aeroplane.to_air
    @planes.delete(aeroplane)
    "plane has taken off"
  end

  def full?
    @planes.count >= @capacity
  end

end
