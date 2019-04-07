require_relative 'plane'

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

    raise "That plane has already landed." if plane_landed?(plane)

    raise "Unable to land plane due to stormy weather." if weather.stormy?

    @planes << plane
    self
  end

  def take_off(plane)
    raise "Unable to take off as the airport is empty." if empty?

    raise "That plane is not in the airport." unless plane_landed?(plane)

    raise "Unable to take off due to stormy weather." if weather.stormy?

    @planes.delete(plane)
  end

  private

  def plane_landed?(plane)
    @planes.include?(plane)
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end

end

class Weather

  def stormy?
    forecast == 1
  end

  def forecast
    rand(1..4)
  end

end
