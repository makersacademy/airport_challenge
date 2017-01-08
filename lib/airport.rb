class Airport

  attr_reader :airport_name, :full, :planes, :capacity
  alias_method :full?, :full

  DEFAULT_CAPACITY = 3

  def initialize(name, capacity=DEFAULT_CAPACITY)
    @airport_name = name
    @full = false
    @planes = []
    @capacity = capacity
  end

  def dock(plane)
    @planes << plane
  end

end
