require 'plane'
require 'weather'
require 'safe_weather'
require 'safety_breach'
require 'covid'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :name, :country, :capacity, :weather, :safety_status
  attr_reader :planes

  def initialize(
    name = 'Schiphol',
    country = 'Netherlands',
    capacity = DEFAULT_CAPACITY,
    weather = Weather.new(0, 2, 10),
    safety_status = SafetyBreach.new([1, 2, 3, 4, 5, 6, 7, 8])
  )
    @name = name
    @country = country
    @planes = []
    @capacity = capacity
    @weather = weather
    @safety_status = safety_status
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  def safety_breach
    @safety_check_result = @safety_status.safety_assesment
  end

  def check_weather
    SafeWeather.safety_check(weather)
  end

  def heath_check(plane)
    Covid.new.covid_check(plane.country_takeoff)
  end

  def arrive(plane)
    heath_check(plane)
    safety_breach
    fail 'Airport is at max capacity.' if full?
    fail 'It is not safe to land here at the moment.' unless check_weather

    arriving_planes(plane)
  end

  def depart(plane)
    safety_breach
    fail 'There are no planes at your disposal.' if empty?
    fail 'It is not safe to depart at the moment.' unless check_weather

    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

  private

  def arriving_planes(plane)
    @planes << plane
  end

end
