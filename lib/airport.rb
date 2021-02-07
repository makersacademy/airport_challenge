require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :weather, :plane, :planes_at_airport

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new, planes_at_airport = [])
    @weather = weather
    @capacity = capacity
    @planes_at_airport = planes_at_airport
  end

  def new_capacity(new_capacity = DEFAULT_CAPACITY)
    @capacity = new_capacity
  end

  def land(plane)
    prevent_landing
    raise "Plane is already at airport, cannot land again." if plane_at_airport?(plane)
    @planes_at_airport << plane
    plane.to_s + " landing now" if plane_at_airport?(plane)
  end

  def take_off(plane)
    prevent_take_off
    @planes_at_airport.delete_at(@planes_at_airport.index(plane)) if @planes_at_airport.include?(plane)
    plane
  end

  def plane_at_airport?(plane)
    puts plane
    return true if @planes_at_airport.include?(plane)

    false
  end

  def full?
    @planes_at_airport.count >= @capacity
  end

  def prevent_landing
    raise "Airport is currently full. You cannot land." if full?
    raise "Weather is currently stormy. You cannot land until it is sunny." if weather.stormy?
  end

  def prevent_take_off
    raise "Weather is currently stormy. You cannot take_off until it is sunny." if weather.stormy?
  end
end
