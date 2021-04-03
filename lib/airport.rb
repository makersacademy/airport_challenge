require_relative 'plane'
class Airport 
  attr_reader :planes
  def initialize
    @planes = []
  end 

  def land(plane)
    @planes << plane
  end 

  def takeoff(*)
    @planes.pop
  end 

  def include?(plane)
    if @planes.include?(plane)
      true
    else 
      false
    end 
  end 
end 
