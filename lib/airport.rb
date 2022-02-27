require_relative 'plane'

class Airport
  def initialize
    @hangar = []
    @capacity = 10
  end

  def land_plane
    raise "The airport is full" unless @hangar.length < @capacity
    @hangar.push(plane = Plane.new)
    plane
  end

  def take_off
    raise "There are no available planes" if @hangar.empty?
    @hangar.pop
  end
end
