class Airport

  attr_reader :capacity, :hangar

  def initialize(capacity = 20)
    @capacity = capacity
    @hangar = []
  end

  def store(plane)
    @hangar << plane
  end

  def release(plane)
    @hangar.delete(plane)
  end

end
