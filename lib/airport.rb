require_relative 'plane'
class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end 

	def land_plane(plane)
    @hangar << plane
  end 

  def take_off(plane)
    @plane
  end 
end
