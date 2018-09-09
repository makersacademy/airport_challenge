require_relative 'airport'

class Plane

  attr_reader :location

  def initialize
    @location = "The Factory"
  end

  def airborne
    @location = "Airborne"
  end

  def grounded(airport)
    @location = airport
  end

end
