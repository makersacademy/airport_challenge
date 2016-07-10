require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    accept(plane) if acceptance_checks(plane)
  end

  def take_off(plane)
    @planes.delete(plane).take_off if take_off_checks(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def acceptance_checks(plane)
    fail 'This plane has already landed here' if @planes.include? plane
    fail 'Airport capacity is full' if full?
    fail 'Could not land because of stormy weather' if @weather.stormy?
    true
  end

  def take_off_checks(plane)
    fail 'This plane was not found in the airport' unless @planes.include? plane
    fail 'Could not take off because of stormy weather' if @weather.stormy?
    true
  end

  def accept(plane)
    @planes << plane
    plane.land
  end

end
