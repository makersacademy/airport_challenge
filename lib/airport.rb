class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 4

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

end
