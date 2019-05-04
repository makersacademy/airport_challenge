require_relative './airports.rb'

class Plane
  def land_at(airport)
    airport.planes << self
    puts 'The plane has landed'
  end

  def take_off_from(airport)
    raise 'Too stormy to take off' if airport.stormy?
    airport.planes.delete(self)
    puts 'The plane has taken off, it is no longer in this airport'
  end
end
