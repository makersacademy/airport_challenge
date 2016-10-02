require_relative 'weather'

class Airport
  attr_reader :capacity, :planes, :weather
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new.get_status
  end

  def land(plane)
    fail_if_full
    fail_if_landed(plane)
    fail_if_weather_is_shit if plane.landed? == false
    plane.send(:set_airport, self)
    planes << plane
  end

  private

  def take_off(plane, destination_airport)
    planes.delete(plane)
    destination_airport.land(plane)
  end

  def fail_if_landed(plane)
    fail "Plane already landed!" if plane.landed?
  end

  def fail_if_full
    fail "Airport is full!" if full?
  end

  def full?
    planes.count >= capacity
  end

  def fail_if_weather_is_shit
    fail "Plane took off, but cannot land! Weather is stormy! Try landing at other airport" if weather == :stormy
  end
end
