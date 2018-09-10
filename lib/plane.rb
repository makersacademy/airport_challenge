require_relative 'airport'
require_relative 'weather'

class Plane

attr_reader :weather

  def initialize(plane_id, weather = Weather.new)
    @plane_id = plane_id
    @weather = weather
  end
#
  def land
    p "Plane #{@plane_id} has landed"
  end

   def take_off
    puts "Plane #{@plane_id} has taken off"
    # write line to delete plane from planes array
   end


end



plane = Plane.new(999)
plane.take_off
plane.land
