class Airport

  attr_accessor :planes

  DEFAULT_CAPACITY = 2

  def initialize
    @planes = []
  end

  def full?
    @planes.length == DEFAULT_CAPACITY
  end
end