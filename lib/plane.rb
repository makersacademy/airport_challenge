require_relative 'airport'

class Plane
  attr_accessor :location

  def land(airport)
    airport.incoming_plane(self)
  end

  def take_off
    raise "** Plane is in the air **" if @location == "air"

    @location.outgoing_plane(self)
  end
end
