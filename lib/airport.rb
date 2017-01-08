require_relative 'plane'

class Airport

  attr_accessor :arrivals, :departures, :runway_open

  def initialize
    @arrivals = []
    @departures = []
    @runway_open = true

  end

  def arrive(plane)
    plane::land_plane
    @arrivals << plane
  end

  def depart(plane)
    check_weather
    plane::take_off
    @arrivals.delete(plane)
    @departures << plane
  end

  def check_weather
    weather = Weather.new
    runway_open?(weather)
  end

  def runway_open?(weather)
    if weather.current_weather == "Stormy"
      @runway_open = false
    else
      @runway_open = true
    end
  end

end
