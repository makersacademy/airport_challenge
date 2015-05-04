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
    if weather == 'stormy'
      fail 'plane cannot land when storm brewing'
    elsif @planes.count == @capacity
      fail 'airport cannot receive planes when at capacity'
    else
      plane.land
      @planes << plane
    end
  end

  def launch plane
    if weather == 'stormy'
      fail 'plane cannot take off when storm brewing'
    else
      plane.takeoff
      @planes.delete(plane)
    end
  end

  def planes
    @planes
  end

end
