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
end
