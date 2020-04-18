class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def is_full?
    if @planes.count == @capacity
      error_message
    else
      false
    end
  end

  private
  def error_message
    fail "Airport is full"
  end
end
