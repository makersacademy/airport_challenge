class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def full?
    if @planes.length >= @capacity
      true
    else
      false
    end
  end

end
