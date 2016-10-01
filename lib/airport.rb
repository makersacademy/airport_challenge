require './lib/plane.rb'

class Airport

  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 15
  end

  def take_off(planes)
    planes = @planes.pop
  end

  def landing(planes)
    fail "There's no room at the inn!" if @planes.length >= @capacity
    @planes << planes
  end

end
