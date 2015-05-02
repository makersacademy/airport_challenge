require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  include Weather

  def initialize(capacity = 6)
    @planes = []
    @capacity = capacity
  end

  def land plane
    if @planes.count == @capacity
      fail 'Airport Full'
    elsif stormy?
      fail 'Stormy weather'
    else
      @planes << plane
      plane.landed = true
    end
  end

  def takeoff
    @planes.pop.takeoff
  end

end
