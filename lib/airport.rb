class Airport

    attr_reader :capacity

  def initialize
    @capacity = 1
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

end