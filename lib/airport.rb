class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "airport is full" if full?
    fail "dangerous weather!" if stormy?

    @planes << plane
  end

  def take_off
    fail "airport is empty" if empty?
    fail "dangerous weather!" if stormy?

    @planes.pop
  end
end

private

CAPACITY = 20

def full?
  @planes.count >= CAPACITY
end

def empty?
  @planes.empty?
end

def stormy?
  likelihood = rand(1..10)
  likelihood < 3
end
