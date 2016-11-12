require_relative 'airport'

class Plane

attr_reader :flying


  def land_at(airport)
    puts "plane has now landed at the airport"
    @flying = false
    return airport.store_plane(self)
  end

  def take_off_from(airport)
    puts "The plane has now taken to the air"
    @flying = true
    return  airport.landing_bay.delete(self) #delete method deletes froma array and returns
  end






  # def take_off
  #   "Plane is now flying"
  # end


end
