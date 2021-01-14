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
    fail "Unable to land; airport at capacity" if airport.full?
    fail "The weather is too bad to land there" if airport.weather.stormy?
    fail "Plane has already landed" if location != "the air"

    airport.plane_list << self
    self.location = airport
    confirm_plane_landed
  end

  def confirm_plane_landed
    puts "#{self} has landed at #{location}."
  end

  def take_off
    fail "Plane is already in the air!" if location == "the air"
    fail "The weather is too bad to take off" if location.weather.stormy?

    airport = location
    airport.plane_list.delete(self)
    self.location = "the air"
    confirm_plane_departed(airport)
  end

  def confirm_plane_departed(airport)
    puts "#{self} has departed from #{airport}. It is now in #{location}."
  end

  private #--------------------------------------------------
  attr_writer :location

end
