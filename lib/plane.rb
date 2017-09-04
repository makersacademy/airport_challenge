require_relative 'airport'
require_relative 'runway'

class Plane

  include Runway
  include Weather

  def report_status(airport)
    @airport = airport
    if @airport.plane_is_already_landed?(self)
   plane_status[:grounded]

    else plane_status[:airborne]
    end
  end

  def plane_status
    { :airborne => "I'm no longer at #{@airport}!",
    :grounded => "I'm at #{@airport}!" }
  end

  def find_the_plane
    arr = []
    ObjectSpace.each_object(Airport){|x| arr << x.object_id }
    arr.each{|x| x.context}
  end

end
