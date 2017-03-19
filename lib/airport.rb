require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "The airport is full" if full?
    # raise "Weather is stormy and you cannot land" if weather.stormy?
    planes << plane
  end

  def take_off(plane)
    raise "The plane can't be found at the airport" unless planes.include?(plane)
    raise "Stormy weather. No planes flying." if weather.stormy?
    planes.delete(plane)
  end

  def get_forecast
    weather = Weather.new
    weather.stormy?
  end
  private
  attr_reader :capacity

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
