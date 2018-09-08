require_relative 'airport'

class Plane

  attr_reader :location

  def initialize
    @location = "The Factory"
  end

  def airborn
    @location = "Airborn"
  end

  def grounded(airport)
    @location = airport
  end

end
