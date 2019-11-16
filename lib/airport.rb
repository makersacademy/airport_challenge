require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 2

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_collected = []
    @capacity = capacity
  end

  def to_land(plane)
    @planes_collected << plane if !denied_landing
  end

  def take_off
    @planes_collected.pop if !denied_take_off
  end

  def stormy?
    return storm = true if rand(1..10) >= 8
    take_off
  end

  private 

  attr_reader :plane 

  def denied_landing
    raise "No authorization to land. Airport is full!" if @planes_collected.size == @capacity
  end

  def denied_take_off
    raise "0 planes available to take off" if @planes_collected.empty?
  end
end
