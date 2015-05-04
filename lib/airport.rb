require 'weather'

class Airport

  include Weather

  attr_accessor :capacity

  def initialize capacity = 10
    @planes = []
    @capacity = capacity
  end

  def capacity=(capacity)
    fail 'capacity cannot be lower than number of planes' if @planes.count > capacity
    @capacity = capacity
  end

  def receive plane
    fail 'plane cannot land when storm brewing' if weather == 'stormy'
    fail 'airport cannot receive planes when at capacity' if @planes.count == @capacity
    plane.land
    @planes << plane
  end

  def launch plane
    fail 'plane cannot take off when storm brewing' if weather == 'stormy'
    plane.takeoff
    @planes.delete(plane)
  end

  def planes
    @planes
  end

end
