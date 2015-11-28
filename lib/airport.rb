require 'plane'


class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :landed_planes, :current_weather, :capacity

  def initialize(capacity=100)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    fail "Can't land, the airport is full" if @landed_planes.count >= capacity
    fail "Can't land in storm" if Weather.stormy?
    plane.land(self)
    @landed_planes << plane

  end

  def take_off(plane)
    fail "Can't take off in storm" if Weather.stormy?
    plane.take_off(self)
    @landed_planes = nil

  end

  def update_capacity(capacity)
    @capacity = capacity
  end


end
