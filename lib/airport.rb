class Airport
  def initialize(weather:, capacity: 10)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if @weather.now == 'sunny' && @planes.length < @capacity
      @planes << plane
      true
    else
      false
    end
  end
end
