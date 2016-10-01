class Airport

  attr_reader :capacity, :weather, :planes

  def initialize
    @capacity = 20
    @weather = "sunny"
    @planes = []
  end

  def accept_plane(plane)
    @planes << plane
  end

  def plane_departs(plane)
    @planes.delete(plane)
  end

  def plane_present(plane)
    @planes.include? plane
  end

  def weather_index
    rand(10)
  end

  def change_weather
    weather_array = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy", "stormy"]
    @weather = weather_array[weather_index]
  end

end
