require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity
  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACITY
  end

  def accept(plane)
    acceptance_checks(plane)
    @planes << plane
    plane.land
  end

  def take_off(plane)
    fail 'This plane was not found in the airport' unless @planes.include? plane
    fail 'Could not take off because of stormy weather' if @weather.stormy?
    @planes.delete(plane).take_off
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def acceptance_checks(plane)
    fail 'This plane has already landed here' if @planes.include? plane
    fail 'Airport capacity is full' if full?
    fail 'Could not land because of stormy weather' if @weather.stormy?
  end

end
