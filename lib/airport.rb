require_relative "./weather.rb"
require_relative "./plane.rb"

class Airport
  DEFAULT_CAPACITY = 20
  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def takeoff(plane)
    fail 'Plane not in airport' unless in_hangar?(plane)
    fail 'Cannot takeoff, bad weather' if weather.stormy?
    hangar.delete(plane)
    "Plane taken off. Hangar has #{hangar.count} plane(s) remaining"
  end

  def land(plane)
    fail "Plane already landed" if in_hangar?(plane)
    fail 'Cannot land, hangar is full' if full?
    fail 'Cannot land, bad weather' if weather.stormy?
    hangar << plane
    "Plane landed. Hangar contains #{hangar.count} plane(s)"
  end

  def full?
    hangar.count >= capacity
  end

  def in_hangar?(plane)
    hangar.include?(plane)
  end

  attr_reader :capacity, :hangar, :weather
  attr_writer :hangar
end
