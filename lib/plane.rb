class Plane
  def initialize
    @at_the_airport = true
  end

  def land_at(airport)
    airport
  end
  
  def take_off
    @at_the_airport = false
  end

  def at_the_airport?
    @at_the_airport
  end
end
