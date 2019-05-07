require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :capacity
  attr_reader :planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = rand(5)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "No landing during storm" if weather == 5

    fail "Airport full" if full?

    @planes << plane
  end

  def take_off
    fail "No take off during storm" if weather == 5

    @planes.pop
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
