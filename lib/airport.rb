require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 2
  attr_reader :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = generate_weather
  end

  def land(plane)
    raise 'Plane already landed' if plane.landed
    raise 'Airport at capacity' if full?
    raise 'Plane cannot land due to stormy weather' if weather == "stormy"
    plane.landed = true
    hangar << plane
  end

  def take_off(plane)
    raise 'Plane already flying' unless plane.landed
    raise 'Plane not in current airport' unless in_airport?(plane)
    raise 'Plane cannot take_off due to stormy weather' if weather == "stormy"
    plane.landed = false
    hangar.delete(plane)
  end

  def in_airport?(plane)
    hangar.include?(plane)
  end

  private

  attr_reader :hangar

  def full?
    hangar.count >= capacity
  end

  def generate_weather
    result = rand(0..4)
    (0..3) === result ? "sunny" : "stormy"
  end
end
