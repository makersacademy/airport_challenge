require 'plane.rb'

class Airport
  def initialize 
    @planes = []
  end 

  def land(plane)
    @planes << plane 
  end 

  def hangar
    @planes 
  end
end 