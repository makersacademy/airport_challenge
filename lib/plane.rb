require_relative 'airport'

class Plane

attr_reader :flying


  def land_at(airport)
    puts "plane has now landed at #{airport}"
    @flying = false
    return airport.store_plane(self)
  end






  # def take_off
  #   "Plane is now flying"
  # end


end
