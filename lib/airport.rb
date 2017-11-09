# require_relative 'weather'
class Airport

  attr_reader :capacity, :terminal, :weather
  DEFAULT_CAPACITY = 2

  public

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @terminal = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    full?
    stormy?
    plane.landed
    terminal << plane
  end

  def take_off(plane)
    plane.air
    stormy?
    terminal.delete(plane)
  end

  private

  def stormy?
    weather.stormy?
  end

  def full?
    raise "Airport is full" if terminal.length >= DEFAULT_CAPACITY
  end
end
