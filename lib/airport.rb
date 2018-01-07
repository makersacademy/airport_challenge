require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off
    fail 'No planes available' if empty?
    fail 'Unable to take off due to adverse weather conditions' if weather.stormy?
    @planes.pop
  end

  def land(plane)
    fail 'Airport full' if full?
    fail 'Unable to land due to adverse weather conditions' if weather.stormy?
    @planes << plane
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end
