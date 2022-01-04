require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 15

  def initialize
    @planes = []
  end

  def capacity
    @capacity = DEFAULT_CAPACITY
  end

  def land plane
    if @planes.count >= DEFAULT_CAPACITY
      fail 'Airport Full!'
    elsif plane.landed? == true
      fail 'Already landed!'
    else
      plane.land
      @planes << plane
    end
  end

  def taking_off
    if empty?
      fail 'No planes here!'
    else
      plane = @planes.pop
      plane.take_off
    end
  end

  def empty?
    @planes.empty?
  end
end
