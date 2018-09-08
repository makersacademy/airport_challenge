require "airport"

class Plane

  def intialze
    @location
  end

  def land_at(airport)
    @location = airport
  end

  def take_off
    fail "Take off too dangerous" if bad_weather?
    @location = "In the air."
  end

  def bad_weather?
    true if rand(10).zero?
  end

end
