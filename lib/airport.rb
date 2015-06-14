require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :planes

  def initialize (capacity = DEFAULT_CAPACITY)

    @capacity = capacity
    @planes = []
  end

  def land plane
    fail 'The airport is full!' if @planes.count == @capacity
    fail 'Can\'t land during a storm!' if self.weather=='stormy'
    @planes<<plane
    plane.land
  end

  def take_off plane
    fail 'Can\'t take off during a storm!' if self.weather=='stormy'
    @planes.delete(plane)
    plane.take_off
  end

  def weather
    rand(1...10) == 1 ? @weather='stormy' : @weather = 'sunny'
  end
end
