class Airport
  def initialize(weather:, capacity: 10)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if plane_can_land?(plane)
      @planes << plane
      true
    else
      false
    end
  end

  def launch(plane)
    if plane_can_launch?(plane)
      @planes.delete(plane)
      true
    else
      false
    end
  end

  private

  def plane_can_land?(plane)
    weather_good? && space? && !plane_here?(plane) && !plane_landed?(plane)
  end

  def plane_can_launch?(plane)
    weather_good? && plane_here?(plane)
  end

  def weather_good?
    @weather.now == 'sunny'
  end

  def space?
    @planes.length < @capacity
  end

  def plane_here?(plane)
    @planes.include?(plane)
  end

  def plane_landed?(plane)
    plane.landed?
  end
end
