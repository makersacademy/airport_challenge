require './lib/plane.rb'

class Airport
  attr_accessor :planes, :capacity

  def initialize(capacity = 5)
    @planes = []
    @capacity = capacity
  end

  def plane_count
    @planes.length
  end
end
