require_relative "plane"
require_relative "air_controller"

class Fleet

  attr_reader :planes

  def initialize
    @planes = 5
  end 

  def land(plane)
    @planes += plane
  end

  def takeoff(plane)
    @planes -= plane
  end 
end 
