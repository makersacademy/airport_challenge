require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFUALT_CAPACITY = 20
  attr_reader :planes, :capacity
  attr_accessor :weather

  def initialize(capacity: DEFUALT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def take_off
    @planes.pop
    "The plane has taken off"
  end

  def land(plane)
    fail "Plane unable to land, airport full" if full?
    fail "Weather is too bad to land" if weather.stormy?
    @planes << plane
    "The plane landed safely"
  end

  private

  def full?
    @planes.count == @capacity
  end
end
