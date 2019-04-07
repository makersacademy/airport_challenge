require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Unable to land plane as the airport is full." if full?

    raise "Unable to land plane as it is already landed." if @planes.include?(plane)

    raise "Unable to land plane due to stormy weather." if weather.stormy?

    @planes << plane
    self
  end

  def take_off(plane)
    raise "Unable to take off as the airport is empty." if empty?

    raise "Unable to take off as that plane is not in the airport." if !@planes.include?(plane)

    raise "Unable to take off due to stormy weather." if weather.stormy?

    @planes.delete(plane)
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end

end
