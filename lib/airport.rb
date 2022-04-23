# require_relative 'plane'

class Airport

  def initialize
    @planes = []
    @capacity = 4
    @weather = "stormy"
  end

  def release_plane
    fail 'weather too stormy for take-off' unless @weather != "stormy"
    Plane.new
  end

  def land_plane
    fail 'airport full' unless @planes.length < @capacity
    fail 'weather too stormy for landing' unless @weather != "stormy"
    @planes << Plane.new
  end

  attr_accessor :planes
  attr_accessor :capacity
  attr_accessor :weather
end
