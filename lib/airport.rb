class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def is_full?
    @planes.count == @capacity ? airport_full_message : false
  end

  private
  def airport_full_message
    fail "Airport is full"
  end
end
