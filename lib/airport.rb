require './lib/weather'
require './lib/air_exceptions'

class Airport

  attr_reader :hangar, :capacity, :weather_generator
  DEFAULT_CAPACITY = 50

  def initialize(capacity = nil, weather = Weather.new)
    @hangar = []
    @capacity = capacity || DEFAULT_CAPACITY
    @weather_generator = weather
  end

  def occupancy
    @hangar.count
  end

  def full?
    occupancy >= @capacity
  end

  def weather
    @weather_generator.get
  end

  def stormy?
    weather == :stormy
  end

  def include?(aeroplane)
    @hangar.include? aeroplane
  end

  def register_arrival(aeroplane)
    @hangar.push(aeroplane)
  end

  def register_departure(aeroplane)
    @hangar.delete(aeroplane)
  end
end
