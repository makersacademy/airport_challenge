class Airport
  attr_reader :planes

  def initialize()
    @planes = []
  end

  def add_plane(plane)
    planes << plane
  end

  def delete_plane(plane)
    planes.delete(plane)
  end

  def weather_conditions()
    rand(2)==0?"stormy":"sunny"
  end

end
