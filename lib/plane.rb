require_relative 'airport.rb'

class Plane

  def land(airport)
    airport.add_plane(self)
    
    # airport.plane = self
  end

  def take_off(airport)
    airport.remove_plane(self)
    # airport.plane = nil
  end


end
