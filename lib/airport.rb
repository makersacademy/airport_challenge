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

  def bad_weather_error
    if weather_conditions == "stormy"
      raise "The weather is stormy"
    end
  end

  def is_full?
    @planes.size ==1? true:false
  end

end
