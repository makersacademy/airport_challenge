require 'plane'
require 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :name, :planes, :capacity, :weather

  def initialize(name = 'Schiphol', capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @name = name
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  def arrive(plane)
    fail 'It is not safe to land here right now.' unless safe_weather?
    fail 'Airport is at max capacity.' if full?
    
    @planes << plane
  end

  def depart(plane)
    fail 'It is not safe to depart right now.' unless safe_weather?
    fail 'There are no planes at your disposal.' if empty?

    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def safe_weather?
    @weather.weather_forecast != "Stormy"
  end

end
