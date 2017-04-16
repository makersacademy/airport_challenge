require './lib/plane.rb'

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    puts "Plane landed"
    planes << plane
  end

end
