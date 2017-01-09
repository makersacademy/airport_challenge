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
      raise 'Airport is full' if full?
      raise 'Plane is already on the ground' if on_ground?(plane)
      @airbourne_planes.delete(plane)
      @planes << plane
    elsif plane.taking_off || plane.taken_off
      raise 'Plane is already in the air' unless airbourne?(plane)
      @planes.delete(plane)
      @airbourne_planes << plane
    end
  end

  private

  def on_ground?(plane)
    @planes.include?(plane)
  end

  def airbourne?(plane)
    @planes.include?(plane)
  end

  def full?
    @planes.size >= @capacity
  end

end
