require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = rand(100)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "No landing during storm" if @weather == 20

    fail "Airport full" if full?

    @planes << plane
  end

  def take_off
    fail "No take off during storm" if @weather == 20

    @planes.pop
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
