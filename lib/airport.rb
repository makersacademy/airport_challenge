class Airport
  DEFAULT_CAPACITY = true
  attr_reader :capacity, :hangar

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end
end
