require_relative "airport"

class Plane

  attr_reader :location, :name

  def initialize(name = "Airbus A320")
    @name = name
    @location = "the air"
  end

  def to_s
    name
  end

  def land(airport)
    fail "The weather is too bad to land there" if airport.stormy?
    fail "Unable to land; airport at capacity" if airport.full?
    fail "Plane has already landed" if @location != "the air"

    airport.plane_list << self
    @location = airport
    puts "#{self} has landed at #{airport}."
  end

  def take_off
    fail "Plane is already in the air!" if location == "the air"
    fail "The weather is too bad to take off" if location.stormy?

    airport = location
    airport.plane_list.delete(self)
    @location = "the air"
    puts "#{self} has departed from #{airport}. It is now in #{location}."
  end

end
