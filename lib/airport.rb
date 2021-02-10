require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes_in_airport, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    full?
    stormy?
    plane.landed
    @planes_in_airport << plane
  end

  def takeoff(plane)
    stormy?
    empty?
    present?(plane)
    plane.departed
    @planes_in_airport.delete(plane)
  end

  def full?
    raise "Airport at full capacity" if @planes_in_airport.length >= @capacity
  end

  def empty?
    raise "No planes available for takeoff" if @planes_in_airport.empty?
  end

  def stormy?
    raise "Weather is too bad for landing/takeoff" if @weather.weather_report == "stormy"
  end

  def present?(plane)
    raise "Plane not at this airport" unless @planes_in_airport.include?(plane)
  end

end
