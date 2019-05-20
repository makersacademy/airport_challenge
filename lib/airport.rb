require 'airplane.rb'
require 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_take_off(weather)
    raise "Stormy weather, take off denied" if weather.stormy
    plane = @planes.pop 
    plane.fly
  end

  def instruct_landing(plane, weather)   
    raise "Stormy weather, landing denied" if weather.stormy
    raise "The airport is full, landing denied" if full?
    plane.land
    @planes << plane
  end

  private

  def full?
    @planes.count >= @capacity
  end
end