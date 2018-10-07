require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 20
  def initialize
    @hangar = []
  end
  def depart_plane
    fail "No Planes in the hangar!" if @hangar.empty?
    @hangar.pop
  end

  def land_plane(plane)
    fail "Hangar is full!" if @hangar.count >= 20
    @hangar << plane
  end

  attr_reader :plane
end
