require_relative './plane.rb'

class Airport
attr_reader :planes
  def initialize
    @planes=[]
  end

  def land(plane)
    fail "airport is full" if @planes.count>=20
    @planes << plane
  end

  def take_off
    fail 'no planes available' if @planes.empty?
    @planes.pop
  end

end
