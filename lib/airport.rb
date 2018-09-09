require './lib/airplane.rb'
require './lib/weather.rb'

class Airport
  attr_reader :planes, :weather

  def initialize(capacity = 20, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    fail 'This airplane is already in the airport' if plane_exists?(plane)
    fail 'This airplane is not in the air' if plane.grounded
    fail 'The airport is full' if full?
    fail 'Weather is stormy: no planes are to land' if @weather.stormy
    plane.lands
    @planes << plane
  end

  def take_off(plane)
    fail 'Weather is stormy: no planes are to take off' if @weather.stormy
    fail 'that plane is not at this airport' unless @planes.include?(plane)
    plane.takes_off
    @planes.delete(plane)
    'airplane has taken off and is no longer in the airport'
  end

  # private #---------------------------------------------

  def full?
    @planes.size >= @capacity
  end

  def plane_exists?(plane)
    @planes.include? plane
  end
end
