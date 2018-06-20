class Airport

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @number_of_planes = 0
    @capacity = capacity
  end

  def can_land?
    !full?
  end

  def can_takeoff?
    true
  end

  def landing plane
    @number_of_planes += 1
  end

  private

  def full?
    @number_of_planes >= @capacity
  end
end
