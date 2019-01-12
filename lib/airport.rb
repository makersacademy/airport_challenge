require_relative  'plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  def taken_off?(plane)
    @planes.include?(plane) ? false : true
    
  end

end
