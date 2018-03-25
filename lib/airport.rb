require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hanger, :weather, :condition

  def initialize(capacity=20)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    if full?
      raise "airport is full"
    else
      @hanger << plane
    end
  end

  def take_off(plane)
    if @sunny == false
      raise "weather is stormy, can't take off"
    else
      @hanger = []
    end
  end

  def full?
    @hanger.size == @capacity
  end

end
