require_relative 'airport'
require_relative 'weather'

class Plane

  def land(airport)
    airport.planes << self unless !safe? || airport.full?
  end

  def take_off(airport)
     airport::planes.shift unless !safe?
  end

  private

  def safe?
    Weather.stormy? ? (raise "Unable to fly as weather is stormy") : true
  end

end
