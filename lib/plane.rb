require "airport"

class Plane

  def intialze
    @location
  end

  def land_at(airport)
    return "Landing is too dangerous" if bad_weather?
    @location = airport
  end

  def take_off
    return "Taking off is too dangerous" if bad_weather?
    @location = "In the air."
  end

  def bad_weather?
    # true if rand(10).zero?
    true
    # false
  end

end
