require_relative 'plane'
require_relative "weather"

class Airport

  attr_reader :airplanes, :capacity
  attr_accessor :stormy

  MAXIMUM_CAPACITY = 20

  def initialize(capacity = MAXIMUM_CAPACITY)
    @airplanes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land_plane(plane)
    fail "Airport full" if airport_full?
    @airplanes << plane
  end

  def take_off
    fail "Can not take off: weather stormy" if @weather.stormy?
    @airplanes.pop
  end
  
  private

  def airport_full?
    @airplanes.length == @capacity
  end
end
