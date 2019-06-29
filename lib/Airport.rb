require_relative './plane.rb'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = 'stormy'
  end

  def land_plane(plane)
    fail "Weather is stormy - Cannot land plane" if @weather == 'stormy'
    @planes << plane
  end

  def plane_take_off(plane)
    @planes.delete(plane)
  end
end
