require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 20
  def initialize
    @hangar = []
  end

  def depart_plane(plane)
    fail "No Planes in the hangar!" if @hangar.empty?
    @hangar.pop
    plane(@@flying = true)
  end

  def land_plane(plane)
    fail "Hangar is full!" if @hangar.count >= 20
    @hangar << plane
    plane(@@flying = false)
  end

  attr_accessor :plane
end
