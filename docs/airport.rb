class Airport

  attr_reader :hanger

  def initialize(capacity = 1)
    @capacity = capacity
    @hanger = []
  end

  def full?
    @hanger.length >= @capacity
  end

end
