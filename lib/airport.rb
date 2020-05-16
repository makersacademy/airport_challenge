class Airport

DEFAULT_CAPACITY = 5

  attr_reader =  DEFAULT_CAPACITY

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full

    @planes << plane
    end


  def full
    @planes.length >= DEFAULT_CAPACITY
  end

  def empty?

  end
end
