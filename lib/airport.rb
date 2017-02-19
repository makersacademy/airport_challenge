require_relative 'plane'
require_relative 'weather'
require_relative 'controller'

class Airport

  attr_reader :weather, :planes, :capacity

  CAPACITY = 15

  def initialize(capacity = CAPACITY)
  @capacity = capacity
  @planes = []
  @weather = Weather.new
  end

  def land(plane)
    raise 'No more room for planes' if airport_full?

    @planes << plane
  end

  def boarding
    raise 'Stormy weather' if stormy_weather

    boarding_plane = @planes.pop
    boarding_plane.air
  end


  def stormy_weather
    @weather.stormy
  end

  def airport_full?
    @planes.length >= @capacity
  end

end
