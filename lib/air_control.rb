require 'plane'
require 'weather'
class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :plane_storage, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @plane_storage = []
    @weather = weather
  end

  def take_off(plane_id)
    fail 'BAD WEATHER, ALL PLANES GROUNDED' if stormy?

    plane_storage.delete(plane_id)
  end

  def land(plane_id)
    fail 'BAD WEATHER, NO LANDING' if stormy?

    fail 'Airport is at max capacity!!!ABORT!' if full?

    plane_storage << plane_id
  end

  def full?
    plane_storage.count >= capacity
  end

  def plane_status(plane_id)
    plane_storage.include?(plane_id)
  end

  def stormy?
    @weather.condition == 'stormy'
  end
end
