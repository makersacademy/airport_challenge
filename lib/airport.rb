require_relative 'plane'

class Airport
  def initialize
    @hangar = []
  end

  def land_plane
    @hangar.push(Plane.new)
    @hangar[-1]
  end

  def take_off
    raise "There are no available planes" if @hangar.empty?
    @hangar.pop
  end
end
