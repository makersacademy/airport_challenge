class Airport

  attr_reader :hanger, :name
  DEFAULT_CAPACITY = 1

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @hanger = []
  end

  def full?
    @hanger.length >= @capacity
  end

end
