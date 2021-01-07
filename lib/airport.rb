#require './lib/plane.rb'

class Airport 
  attr_reader :capacity, :planes

  def initialize(capacity)
    @capacity = capacity
    @planes = 0
  end

  def land(plane)
    raise 'Airport cannot accept more than one' if @planes >= @capacity
    @planes += 1
  end

  def take_off(plane)
    @planes -= 1
  end
end