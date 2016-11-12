require_relative "airport.rb"

class Plane
  attr_accessor :has_landed

  def initialize(has_landed = false)
    @has_landed = has_landed
  end

  def land(airport)
    airport.take(self)
    self.has_landed = true
    true
  end

  def take_off(airport)
    airport.release(self)
    self.has_landed = false
    true
  end

end
