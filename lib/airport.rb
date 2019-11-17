require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 2

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_collected = []
    @capacity = capacity
  end

  def to_land(plane)
    @planes_collected << plane unless denied_landing
  end

  def take_off
    @planes_collected.pop unless denied_take_off
  end

  def stormy?
    rand(1..10) >= 2
  end

  private 

  attr_reader :plane 

  def denied_landing
    raise "Abort landing. Full airport." if @planes_collected.size == @capacity
    # raise "Abort to land!. Storm hapenning." if stormy?
  end

  def denied_take_off
    raise "No planes to take off. Airport is empty." if @planes_collected.empty?
  end
end
