require_relative 'airport'
require 'pry'
class Plane
  attr_reader :location

  def initialize
    @location = "AIR"
  end

  def land(airport)
    raise "You are already landed" if flying? == false
    raise "Airport full" if airport.full?
    airport.receive_plane(self)
    @location = "AIRPORT" unless airport.stormy?
  end

  def take_off(airport)
    raise "You are already flying" if @location == "AIR"
    airport.release_plane(self)
    @location = "AIR" unless airport.stormy?
  end

  def flying?
    @location == "AIR"
  end

end
