require_relative 'airport'

class Plane
  def land(airport)
    @location = airport
    "The plane has landed at #{@location}"
  end

  def take_off
    "The plane has taken off from #{@location}"
  end
end
