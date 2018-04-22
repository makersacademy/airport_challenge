
class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 1

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

end
