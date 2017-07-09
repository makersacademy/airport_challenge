require_relative 'plane' #i had to look this up via google

class Airport
  attr_reader :plane

  def land_plane(plane) #rspec found wrong number of arguments: sorted
    @plane = plane

  end

  def landed(plane)
    @plane = plane

  end

  #def takeOff_plane(plane)
    #true

  #end

end
