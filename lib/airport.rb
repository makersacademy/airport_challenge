require "./lib/plane.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = [] # stores planes
  end

  def landing(plane)
    @planes << plane # pushes the landed plane into the array
  end

  def take_off(plane)
    
  end

end
