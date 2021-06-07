require_relative "plane"
require_relative "weather"

class Airport

  attr_reader :planes
  attr_accessor :capacity, :sunny

  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    condition = Weather.new
    @weather = condition.sunny
  end

  def land_plane(plane)
    fail "Airport is full!" if planes.length == capacity
    fail "Stormy weather so cannot land" unless sunny
    fail "Plane has landed" if plane.landed
    plane.landed = true
    planes << plane
  end

  def plane_takeoff(plane)
    fail "Stormy weather so cannot take off" unless sunny
    fail "Plane has taken off!" unless plane.landed
    return plane if check_plane(plane) == plane
    fail "Plane is not at this airport"
  end

  private

  def check_plane(plane)
    planes.each_with_index do |check,index|
      next unless check == plane
      planes.delete_at(index)
      plane.landed = false
      return plane
    end
  end

end
