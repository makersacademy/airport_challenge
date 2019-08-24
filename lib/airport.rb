require 'weather'
require 'plane'

class Airport

  attr_reader :hangar, :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Stormy weather" if @weather.stormy?
    @hangar << plane
  end

  def take_off
    fail "Stormy weather" if @weather.stormy?
    "plane takes off"
    @hangar.pop
  end

end
