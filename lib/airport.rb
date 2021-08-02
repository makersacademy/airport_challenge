require_relative "plane"
require_relative "weather"

class Airport
  attr_accessor :landed_planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity.positive? ? capacity : DEFAULT_CAPACITY
  end

  def land(plane)
    landing_requirements_passed?(plane)
    plane.land
    @landed_planes << plane
    "#{plane} has landed successfully"
  end

  def take_off(plane)
    take_off_requirements_passed?(plane)
    plane.take_off
    @landed_planes.delete(plane)
    "#{plane} has taken off successfully"
  end

  private

  def landing_requirements_passed?(plane)
    raise "No landings allowed while the weather is stormy" if Weather.stormy?
    raise "This is not a plane" unless plane.instance_of?(Plane)
    raise "This plane has already landed" if @landed_planes.include?(plane)
    raise "The airport is full" if full?
    raise "This plane has landed somewhere else" unless plane.flying?
  end

  def take_off_requirements_passed?(plane)
    raise "No take offs allowed while the weather is stormy" if Weather.stormy?
    raise "Plane is not at the airport" unless @landed_planes.include?(plane)
  end

  def full?
    @landed_planes.size >= @capacity
  end
end
