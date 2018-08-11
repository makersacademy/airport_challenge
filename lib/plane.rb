require_relative "./airport.rb"

class Plane

  def land(airport)
    airport.hanger << self
  end

  def take_off(airport)
    p "The plane is no longer at #{airport}"
    airport.hanger -= [self]
    # only taking last off, may need to search and pop
  end

end
