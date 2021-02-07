require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @weather = weather
    @capacity = capacity
    @planes_at_airport = []
  end

  def new_capacity(new_capacity = DEFAULT_CAPACITY)
    @capacity = new_capacity
  end

  def land(plane)
    full?
    prevent_landing if weather.stormy? || full?
    @planes_at_airport << plane
    return plane
  end

  def take_off(plane)
    prevent_take_off if weather.stormy?
    if @planes_at_airport.include?(plane)
      @planes_at_airport.delete_at(@planes_at_airport.index(plane))
    end
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
    raise "Weather is currently stormy. You cannot land until it is sunny again." if weather.stormy?
  end

  def prevent_take_off
    raise "Weather is currently stormy. You cannot take_off until it is sunny again." if weather.stormy?
  end

end
