class Airport
  DEFAULT_CAPACITY = 100

  attr_accessor :weather, :number_of_planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @weather = weather_update
    @number_of_planes = 0
    @capacity = capacity
  end

  def add_plane
    @number_of_planes += 1
  end

  def subtract_plane
    @number_of_planes -= 1
  end

  private

  def weather_update
    rand(5) == 0 ? 'stormy' : 'sunny'
  end
end