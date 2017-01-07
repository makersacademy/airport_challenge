class Airport
  attr_reader :capacity, :planes

  def initialize
    @capacity = 1
    @planes = []
  end

  def override_capacity(new_capacity)
    @capacity = new_capacity
  end

end
