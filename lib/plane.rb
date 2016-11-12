require_relative 'airport'

class Plane



  def land_at(airport)
    puts "plane has now landed at #{airport}"
    airport.store_plane(self)
  end






  # def take_off
  #   "Plane is now flying"
  # end


end
