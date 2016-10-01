require './lib/plane.rb'

class Airport


  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off(planes)
    planes = @planes.pop
  end

  def landing(planes)
    fail "There's no room at the inn!" if @planes.length >= @capacity
    @planes << planes
  end

end
