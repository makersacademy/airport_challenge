require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Unable to land due to stormy weather" if weather.stormy?
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail "Unable to take_off due to stormy weather" if weather.stormy?
    plane.take_off
    selected_plane = planes.select {|x| x == plane}
    planes.delete_if {|x| x == plane}
    selected_plane
  end

  private
  attr_reader :planes, :weather

  def full?
    planes.length >= capacity ? true : false
  end

end
