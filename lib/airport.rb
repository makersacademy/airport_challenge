require './lib/plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def take_off(planes)
    planes = @planes.pop
  end

  def landing(planes)
    fail "There's no room at the inn!" if @planes.length >= 15
    @planes << planes
  end

end
