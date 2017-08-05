class Airport

  attr_accessor :weather, :full, :capacity
  DEFAULT_CAPACITY = 100

  def initialize (weather = "sunny", full = false, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @full = full
    @capacity = capacity
  end


end
