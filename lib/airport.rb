class Airport

  DEFAULT_CAPACITY = 2
  attr_reader :capacity, :planes

  def initialize(number = DEFAULT_CAPACITY)
    @capacity = number
    @planes = []
  end

  # def dock
  #   fail "Sorry love, no more space here." if full?
  # end
  #
  def full?
    fail "full" if @planes.count >= @capacity    
  end
end
