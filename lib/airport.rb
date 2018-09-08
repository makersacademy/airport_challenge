require './lib/airplane.rb'

class Airport
  attr_reader :planes

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
    @stormy = false
  end

  def land_plane(plane)
    fail 'This airplane is already in the airport' if plane_exists?(plane)
    fail 'The airport is full' if full?
    fail 'Weather is stormy: no planes are to land' if @stormy
    @planes << plane
  end

  def take_off
    fail 'Weather is stormy: no planes are to take off' if @stormy
    @planes.pop
    'airplane has taken off and is no longer in the airport'
  end

  def weather_turns
    @stormy = !@stormy
  end

  def full?
    @planes.size >= @capacity
  end

  def plane_exists?(plane)
    @planes.include? plane
  end
end
