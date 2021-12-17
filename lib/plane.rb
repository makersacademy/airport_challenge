require_relative 'airport'

class Plane

  def land(airport)
    airport
  end

  def take_off(airport)
    return "#{self} is no longer in #{airport}"
  end
end
