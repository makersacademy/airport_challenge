require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane_hangar
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @plane_hangar = []
  end

  def land_plane(plane)
    raise 'Plane is already on the ground' if plane_hangar.any?{|planes| planes == plane}
    raise 'Airport is full' if plane_hangar.count >= capacity
    plane.on_ground
    plane_hangar << plane
  end

  def take_off
    raise 'No planes available' if plane_hangar.empty?
    raise 'takeoff prevented when weather is stormy' if Weather.new.dangerous_weather?
    plane_hangar.each do |plane|
      plane.in_air
      return plane_hangar.shift
    end
  end
  private
  attr_reader :plane_hangar
end
