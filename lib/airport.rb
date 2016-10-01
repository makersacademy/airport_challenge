require './lib/plane.rb'

class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def take_off(plane)
    plane = @plane.pop
  end

  def landing(plane)
    fail "There's no room at the inn!" if @plane.length == 1
    @plane << plane
  end

end
