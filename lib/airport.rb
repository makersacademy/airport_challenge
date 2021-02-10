require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :weather, :hangar, :capacity

  DEFAULTCAPACITY = 10

  def initialize(capacity = DEFAULTCAPACITY, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Airport is full" if full?
    fail "Plane cannot land due to stormy weather conditions" if @weather.stormy?
    fail "Plane cannot land if already landed" if @hangar.include?(plane)

    @hangar << plane
  end

  def take_off(plane)
    fail "Plane cannot take off due to stormy weather conditions" if @weather.stormy?
    fail "Plane is not in this airport" unless @hangar.include?(plane)

    @hangar.delete(plane)
  end

  def override_capacity(number)
    @capacity = number
  end

  private

  def full?
    @hangar.length >= @capacity
  end

end
