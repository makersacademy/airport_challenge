require './lib/plane.rb'

class Airport
  attr_reader :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @airport = []
  end

  def land(plane)
    raise "Plane already in airport" unless in_airport?(plane) == false
    raise "Airport Full" unless full? == false
    raise "No landing, stormy weather" unless stormy? == false

    @airport << plane
    @airport.last
  end

  def takeoff(plane)
    raise "Plane not in airport" unless in_airport?(plane)
    raise "No takeoff, stormy weather" unless stormy? == false

    @airport.delete(plane)
  end

  def confirm_departure(plane)
    in_airport?(plane) ? "Plane in Airport" : "Plane not in Airport"
  end

  def in_airport?(plane)
    @airport.include?(plane)
  end

  def full?
    @airport.count >= @capacity
  end

  def chance
    rand(10)
  end

  def stormy?
    chance < 3
  end
end
