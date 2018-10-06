require_relative 'airport'
require 'pry'
class Plane
  attr_reader :location

  def initialize
    @location = "AIR"
  end

  def land(airport)
    airport.receive_plane(self)
    @location = "AIRPORT" unless airport.stormy?
  end

  def take_off(airport)
    airport.release_plane(self)
    @location = "AIR" unless airport.stormy?
  end

end
