class Airport

  attr_accessor  :full, :capacity, :weather
  DEFAULT_CAPACITY = 100

  def initialize (full = false, capacity = DEFAULT_CAPACITY)
    @full = full
    @capacity = capacity
    rand(9) == 0 ? @weather = "stormy" : @weather = "sunny"
  end

end
