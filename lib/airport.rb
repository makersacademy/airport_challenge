# Defines the class Airport
require_relative 'plane'

class Airport
  attr_accessor :plane

  def initialize(plane)
    @plane = plane
  end  

  # def plane
  #  @plane
  # end   

  def capacity?
  end

  def release_plane
    @plane
  end 

  def dock_plane(plane)
    @plane
  end
  
  def stormy_weather?
    # currently set up to be a 1 in 3 chance of stormy weather
    # return rand(2) == 1 ? true : false
    return rand(2) == 1
  end  
end
