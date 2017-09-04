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
    runway_hasher
    #Adds each airport to hash with runway traffic as key
     Airport.all_offspring.each{|x| @@runway_hash[x]}
     #Accesses that hash
     the_airport_it_is_at = @@runway_hash.key([self])
      #accesses plane
      "I am at #{the_airport_it_is_at}"
    #  the_plane = the_airport_it_is_at.instance_variable_get(:@runway_traffic)
      #accesses the airport it is at
  end



end
