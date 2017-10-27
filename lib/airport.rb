require './lib/weather'
require './lib/air_exceptions'

class Airport

  attr_reader :hangar, :capacity, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity = nil, weather = Weather.new)
    @hangar = []
    @capacity = capacity || DEFAULT_CAPACITY
    @weather = weather
  end

  def occupancy
    @hangar.count
  end

  def full?
    occupancy >= @capacity
  end

  def capacity_check
    raise AirportError, "at capacity" if full?
  end
end
