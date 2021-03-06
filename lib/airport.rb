require 'plane'
require 'weather'
require 'safe_weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :name, :planes, :capacity, :weather

  def initialize(
    name = 'Schiphol',
    capacity = DEFAULT_CAPACITY,
    weather = Weather.new(0, 2, 10)
  )
    @name = name
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  def arrive(plane)
    fail 'Airport is at max capacity.' if full?
    fail 'It is not safe to land here at the moment.' unless SafeWeather.safety_check(weather)

    @planes << plane
  end

  def depart(plane)
    fail 'There are no planes at your disposal.' if empty?
    fail 'It is not safe to depart at the moment.' unless SafeWeather.safety_check(weather)

    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

end
