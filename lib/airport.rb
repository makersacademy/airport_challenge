require_relative 'plane'
require 'weather'

class Airport
  attr_reader :plane, :in_air, :in_airport, :take_off

  def initialize
    @in_airport = []
    @in_air = []
  end

  def land(plane)
    #adds plane to the in_airport array
    @in_airport.push(plane)
  end

  # def landed?(plane)
  #   @plane = plane
  # end

  def take_off(plane, safe)
    #adds plane to the in_air array
    raise "It isn't safe to fly." if !safe
    @in_air.push(plane)
  end
end
