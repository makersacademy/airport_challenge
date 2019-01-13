require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :runway

  def initialize
    @runway = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'Reached Maximum Capacity' if @runway.count >= 10
    fail 'Already landed' if @runway.include?(plane)
    @runway.push(plane)
  end

  def takeoff(plane)
    # fail 'Stormy, no take-off' if @weather.stormy?
     @runway.delete(plane)
     plane
  end
#
#   def stormy?
#     @weather.forecast == (1..8)
#   end

#   def sunny?
#     @weather.forecast == (9..10)
end
