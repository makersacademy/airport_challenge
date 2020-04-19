require './lib/plane.rb'

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def plane_count
    @planes.length
  end 
end
