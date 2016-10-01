require './lib/plane.rb'
require './lib/weather.rb'

class Airport

include Weather

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20


  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity

  end

  def take_off
    fail "There aren't any planes!" if empty?
    plane = @planes.pop
    fail "It's blowing a gale out there!" if stormy?
    plane
  end

  def landing(planes)
    fail "There's no room at the inn!" if full?
    @planes << planes
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count == DEFAULT_CAPACITY
  end

end
