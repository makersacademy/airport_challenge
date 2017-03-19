require_relative 'plane'

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

  def take_off
    raise "No planes at the airport" if empty?
    planes.pop
  end

  # def get_forecast(weather)
  # end
  private
  # attr_reader :capacity

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
