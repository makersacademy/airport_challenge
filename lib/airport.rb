require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    # fail "Plane cannot land in stormy weather" if weather?
    fail "Airport is full" if full?
    planes << plane
  end

  def takeoff_plane
    # fail 'No longer in the airport'
    fail 'Plane cannot takeoff in stormy weather' if weather?
    fail 'No planes at the airport' if empty?
    planes.pop
  end

  private 

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def weather?
    weather = Weather.new
    weather.stormy?
  end

end