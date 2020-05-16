class Airport

  attr_reader :capacity, :planes

  def initialize(cap = DEFAULT_CAPACITY)
    @planes = []
    @capacity = cap
  end

  DEFAULT_CAPACITY = 100

  def at_capacity?
    false
    #depends on the length of @planes array
  end

end
