require_relative "plane"
class Airport
  attr_reader :capacity, :hangar
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Plane cannot land: weather is stormy" if stormy?
    raise "Plane cannot land: airport full" if full?
    @hangar << plane
  end

  def take_off(plane)
    raise "Plane cannot take_off: weather is stormy" if stormy?
    @hangar.delete(plane)
  end

  def planes_in_hangar
    @hangar.count
  end

  # private

  def full?
    planes_in_hangar == @capacity
  end

  def weather
    rand(1..7) >= 3 ? "Clear Skies" : "Stormy"
  end

  def stormy?
    weather == "Stormy"
  end 

end

