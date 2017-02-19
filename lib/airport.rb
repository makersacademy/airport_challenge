require_relative 'plane'
require 'weather'

class Airport
  attr_reader :plane, :in_air, :in_airport, :take_off, :stormy

  def initialize
    @in_airport = []
    @in_air = []
    @weather = Weather.new.todays_forecast
    #@todays_forecast = weather
  end

  def land(plane)
    #adds plane to the in_airport array
    @in_airport.push(plane)
  end

  def stormy?
    @weather == "stormy" ? true : false
  end

  def take_off(plane)
    if stormy?
    raise "It isn't safe to fly."
  else
    @in_air.push(plane)
  end
  end
end

# def landed?(plane)
#   @plane = plane
# end

# def take_off(plane)
#   # @unsafe = unsafe
#   if @unsafe
#   raise "It isn't safe to fly." #if :unsafe
# else
#   raise "Preparing for take off"
#   @in_air.push(plane)
# end
# end
