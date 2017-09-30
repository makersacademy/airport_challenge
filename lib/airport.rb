require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane, landed = true)
    fail "Sorry plane has already landed!" if @planes.include? plane
    plane.landed = landed
    @planes << plane
  end

  def take_off(plane)
    fail "Sorry, no planes!" if @planes.empty?
    @planes.pop
  end

end
