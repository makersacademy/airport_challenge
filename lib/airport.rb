require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "The airport is full" if full?
    # raise "Weather is stormy and you cannot land" if weather.stormy?
    planes << plane
  end

  def take_off(plane)
    raise "The plane can't be found at the airport" unless planes.include?(plane)
    planes.delete(plane)
  end

  # def get_forecast(weather)
  # end
  private
  # attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
