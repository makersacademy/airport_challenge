class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 4

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

end
