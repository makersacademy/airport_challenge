class Airport
  attr_reader :hanger
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def full?
    @hanger.length == @capacity
  end
end
