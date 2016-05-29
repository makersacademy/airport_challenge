require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity
  attr_reader :planes

  CAPACITY = 10

  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def dock(plane, weather)
    self.check_weather(weather)
    self.full?
    @planes << plane
  end

  def check_for_landed(plane)
    @planes.include? plane
  end

  def release(plane, weather)
    self.check_weather(weather)
    @planes.delete(plane)
  end

  def check_weather(weather)
    fail 'No planes can land or take off in a storm' if weather.stormy?
  end

  def full?
    fail 'Airport is at full capacity' if @planes.count >= @capacity
  end
end
