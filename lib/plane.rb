require 'airport'

class Plane

attr_reader :location, :sky, :airport

  def land(airport)
    raise Error, "not in flight" if @location == :airport
    @location = :airport
  end

  def take_off
    raise Error, "already in flight" if @location == :sky
    @location = :sky
  end

end
