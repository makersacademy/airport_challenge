require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :arrivals, :departures, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @arrivals = []
    @departures = []
    @weather = weather
    @capacity = capacity

  end

  def land(plane)
    if @weather.stormy == true
      runway_closed
    elsif @arrivals.length >= @capacity
      airport_full
    else
      plane.land_plane
      @arrivals << plane
    end
  end

  def depart(plane)
    if @weather.stormy == true
      runway_closed
    else
      plane.take_off
      @arrivals.delete(plane)
      @departures << plane
    end
  end

  def runway_closed
    raise "The runway is closed due to poor weather conditions"
  end

  def airport_full
    raise "The airport is closed as it has reached capacity"

  end

end
