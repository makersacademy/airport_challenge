require_relative 'plane'

class Airport 
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :planes_landed

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise 'You can not land, airport is full!' if full?
    raise 'Weather is too bad, you are not allowed to land' if stormy?
    @planes_landed << plane
  end

  def takeoff
    raise 'Weather is too bad, you are not allowed to take off' if stormy?
    raise 'Airport is empty' if empty?
    @planes_landed.pop
  end

  private

  def full?
    @planes_landed.count >= @capacity
  end

  def empty?
    @planes_landed.count <= 0
  end

  def stormy?
    rand(1..10) > 8
  end
end