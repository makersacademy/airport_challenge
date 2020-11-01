class Airport

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

end
