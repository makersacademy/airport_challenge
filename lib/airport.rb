class Airport
  attr_accessor :plane
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @plane = plane
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  DEFAULT_CAPACITY = 10

  def land(airport)
    raise 'Bad weather, landing denied' if stormy?
    raise 'Airport full, landing denied' if full?
    @planes << airport
  end

  def take_off(plane)
    raise 'No planes present' if empty?
    raise 'Bad weather, take-off denied' if stormy?
    @planes.delete(plane) && "#{plane} has taken off"
  end

  # private

  def empty?
    @planes.size.zero?
  end

  def full?
    @planes.size >= capacity
  end

  attr_reader :weather

  def stormy?
    @weather == "stormy"
  end
end

class Weather
  [:stormy, :fine, :fine, :fine].sample
end

class Plane
end
