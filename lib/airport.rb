require_relative 'plane'

class Airport
  attr_reader :planes, :capacity, :weather

  def initialize(capacity = 10, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Unable to land a plane as the airport is full." if full?
    raise "Unable to land a plane due to stormy weather." if weather.stormy?

    @planes << plane
    self
  end

  def take_off(plane)
    raise "Unable to take off as the airport is empty." if empty?
    raise "Unable to take off due to stormy weather." if weather.stormy?

    @planes.delete_at(@planes.find_index(plane))
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count.positive?
  end

end

class Weather

  def stormy?
    forecast == :stormy
  end

  private

  def forecast
    weather_type = [:stormy, :sunny, :sunny]
    weather_type.sample
  end

end
