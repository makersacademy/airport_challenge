require_relative 'plane'

class Airport

  attr_reader :planes, :capacity

  def random_weather
    Random.rand(1..10).even? ? 'stormy' : 'calm'
  end

  def initialize(capacity = 6)
    @planes = []
    @capacity = capacity
  end

  def land plane

    if @planes.count == @capacity
      fail 'Airport Full'
    elsif random_weather == 'stormy'
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