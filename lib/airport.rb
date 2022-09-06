require_relative 'plane'

class Airport

  CAPACITY = 5
  WEATHER = { 0 => "stormy", 1 => "fine", 2 => "fine", 3 => "fine" }

  def initialize(capacity = CAPACITY, weather = WEATHER[rand(4)])
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def release_plane(_plane)
    fail 'weather too stormy for take-off' unless @weather != "stormy"
    @planes.pop
  end

  def land_plane(plane)

    fail 'airport full' if @planes.length == @capacity
    fail 'weather too stormy for landing' unless @weather != "stormy"
    @planes << plane
  end

  attr_accessor :planes
  attr_accessor :capacity
  attr_accessor :weather

end
