require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  attr_reader :planes, :capacity, :weather

  def land(plane)
    airport_full?
    stormy?
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    airport_empty?
    stormy?
    plane.departed
    @planes.pop
  end

  def airport_full?
    fail 'Airport is full, plane cannot be landed' if @planes.length == @capacity
  end

  def airport_empty?
    fail 'No planes are currently at the airport' if @planes.empty?
  end

  def stormy?
    fail "Stormy weather, plane cannot land or take off" if @weather.weather_report == "stormy"
  end
end
