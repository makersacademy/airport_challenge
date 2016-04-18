require_relative "airport"

class Plane

  def take_off
    @grounded = false
  end

  def land
    @grounded = true
  end

  def in_airport?
    @grounded
  end

end
