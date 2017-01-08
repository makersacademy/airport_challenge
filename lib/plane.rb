require_relative 'airport'

class Plane

  def land(airport)
    airport::planes << self
    "The plane has successfully landed"
  end

  def take_off(airport)
    airport::planes.shift unless !safe?
  end

  private

  def safe?

  end

end
