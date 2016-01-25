class Airport
  DEFAULT_CAPACITY = 100

  attr_accessor :weather, :number_of_planes

  def initialize
    @weather = weather_update
    @number_of_planes = 0
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