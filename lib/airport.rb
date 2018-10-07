require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :plane, :capacity, :flying
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def depart_plane(plane)
    fail "No Planes in the hangar!" if @hangar.empty?
    @hangar.delete(plane)
    $plane_status = true
    plane
  end

  def land_plane(plane)
    fail "Hangar is full!" if @hangar.count >= @capacity
    @hangar << plane
    $plane_status = false
    plane
  end

end
