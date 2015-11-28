require 'plane'


class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :landed_planes, :current_weather, :capacity

  def initialize(capacity=100)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    raise "Can't land, the airport is full" if @landed_planes.count >= capacity
    raise "Can't land in storm" if Weather.stormy?
    @landed_planes << plane
    plane.report_landed
  end

  def take_off(plane)
    raise "Can't take off in storm" if Weather.stormy?
    @landed_planes = nil
    plane.report_taken_off
  end

  def update_capacity(capacity)
    @capacity = capacity
  end


end
