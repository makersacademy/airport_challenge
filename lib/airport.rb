class Airport
  def initialize(weather:, capacity: 10)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if @weather.now == 'sunny' && @planes.length < @capacity && !@planes.include?(plane) && !plane.landed?
      @planes << plane
      true
    else
      false
    end
  end

  def launch(plane)
    if @weather.now == 'sunny' && @planes.include?(plane)
      @planes.delete(plane)
      true
    else
      false
    end
  end
end
