class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def recieve_plane(plane)
    fail "airport is full" if full?
    fail "dangerous weather!" if stormy?

    @planes << plane
  end

  def release_plane
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
  @planes.count < 1
end

def stormy?
  roll = rand(1..10)
  roll < 2
end
