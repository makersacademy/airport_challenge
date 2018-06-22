class Airport

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @number_of_planes = 0
    @capacity = capacity
    @weather = Weather.new
  end

  def can_land?
    !(full? or @weather.isStormy?)
  end

  def can_takeoff?
    !@weather.isStormy?
  end

  def landing plane
    @number_of_planes += 1
  end

  private

  def full?
    @number_of_planes >= @capacity
  end
end
