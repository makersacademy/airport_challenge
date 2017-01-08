class Airport

  attr_reader :airport_name, :full, :planes
  alias_method :full?, :full

  DEFAULT_CAPACITY = 3

  def initialize(name)
    @airport_name = name
    @full = false
    @planes = []
  end

  def dock(plane)
    @planes << plane
  end

end
