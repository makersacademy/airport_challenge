require 'airport'
require 'weather'

class Plane

  attr_reader :plane_is_landed


  def initialize(plane_is_landed = false)
    @plane_is_landed = plane_is_landed
  end

  def proceed_to_land(airport_name, stormy = false)#weather = Weather.new)
    fail 'Landing is not possible. All landing has been suspended due to stormy weather' if stormy
    fail 'Landing is not possible. Airport full' if airport_name.full?
    airport_name.accept_plane(self)
    @plane_is_landed = airport_name.landed?(self)
    puts "Plane has landed sucessfully" if @plane_is_landed
  end

  def takeoff_from(airport_name, stormy = false)#weather = Weather.new)
    fail 'Plane is not at this airport' unless airport_name.landed?(self)
    fail 'Take-off is not possible. All planes have been grounded due to stormy weather' if stormy
    airport_name.takeoff(self)
    @plane_is_landed = airport_name.landed?(self)
    puts "Plane has taken-off sucessfully" if !@plane_is_landed
  end
end
