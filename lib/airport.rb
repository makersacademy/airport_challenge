require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hanger = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Too stormy to land." if weather.stormy?
    fail "Airport too full to land" if hanger.count >= capacity
    plane_landed(plane)
  end

  def plane_landed(plane)
    hanger << plane
    "Flight #{plane} has landed at the airport."
  end

  def take_off
    fail "Too stormy to take off." if weather.stormy?
    fail "There are no planes in the hanger." if hanger.count < 1
    departure = hanger.pop
    "Flight #{departure} has taken off from the airport."
  end


  private

  attr_reader :weather
  attr_accessor :hanger



end
