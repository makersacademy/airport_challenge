class Airport

  attr_reader :hanger, :name

  def initialize(name, capacity = 1)
    @name = name
    @capacity = capacity
    @hanger = []
  end

  def full?
    @hanger.length >= @capacity
  end

end
