class Airport

  CAPACITY = 10
  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_accessor :planes
  attr_accessor :capacity
end
