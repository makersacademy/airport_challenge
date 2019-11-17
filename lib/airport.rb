require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

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
    rand(1..10) >= 8
  end

  private 

  attr_reader :plane 

  def denied_landing
    raise "Storm hapenning: Please try again later." if stormy?
    raise "Airport is full: Take off some planes." if full
  end

  def denied_take_off
    raise "Storm hapenning: Please try again later." if stormy?
    raise "Airport is empty: Insert a plane." if @planes_collected.empty?
  end

  def full
    @planes_collected.size == @capacity
  end
end
