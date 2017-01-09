require_relative 'air_traffic_controller'
require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :planes, :airbourne_planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @airbourne_planes = []
  end

  def fleet(plane)
    if plane.landing || plane.landed
      raise 'Airport is full' if @planes.size >= @capacity
      raise 'Plane is already on the ground' if @planes.include?(plane)
      @airbourne_planes.delete(plane)
      @planes << plane
    elsif plane.taking_off || plane.taken_off
      raise 'Plane is already in the air' unless @planes.include?(plane)
      @planes.delete(plane)
      @airbourne_planes << plane
    end
  end
end
