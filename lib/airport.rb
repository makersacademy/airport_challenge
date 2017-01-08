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
    set_full
  end

  private

  def set_full
    @full = airport_full?
  end

  def airport_full?
    @capacity <= @planes.length ? true : false
  end



end
