require './lib/plane.rb'
class Airport 

  def initialize 
    @plane = []
  end


  def full_capacity?
   false
  end


  def land_plane(plane)
   @plane << plane

  end


end