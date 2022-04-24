class Airport

  DEFAULT_CAPACITY = 100
  attr_accessor :planes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end 
end

