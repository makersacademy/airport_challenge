require_relative 'plane'
class Airport

  attr_reader :plane
  #def initialize
    #@planes = []
  #end

  def land(plane)
    @plane = plane
    #fail 'Airport is full' if @planes.length >= 20
    #@planes << plane
  end

  def take_off(plane)
    Plane.new
  end
end
