require_relative "plane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes
  attr_accessor :capacity, :sunny

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    condition = Weather.new
    @weather = condition.sunny
  end

  def land_plane(plane)
    fail "Airport full!" if planes.length == capacity
    fail "Weather Stormy cannot land" unless sunny
    fail "Airplane is already here" if plane.landed
    plane.landed = true
    planes << plane
  end

  def plane_takeoff(plane)
    fail "Weather Stormy cannot take off" unless sunny
    fail "  Plane is already in the sky!" unless plane.landed
    return plane if check_plane(plane) == plane
    fail "Airplane is not at this airport"
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
