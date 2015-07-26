require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_accessor :capacity
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy'].sample
  end

  def instruct_land plane
    fail 'Airport full' if full?
    plane.land
    @planes << plane
  end

  def instruct_take_off
    fail 'No planes available' if empty?
    fail 'You cannot take off now, the weather is too bad' if stormy?
    plane = @planes.pop
    plane.take_off
  end

  private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

  def stormy?
    weather == 'stormy'
  end

end
