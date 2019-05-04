require_relative './airports.rb'

class Plane
  def land_at(airport)
    airport.planes << self
  end

  def take_off_from(airport)
    airport.planes.delete(self)
    puts 'The plane has taken off, it is no longer in this airport'
  end
end
