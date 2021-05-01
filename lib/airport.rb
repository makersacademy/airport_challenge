class Airport
  def initialize(weather:, capacity:)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(*)
    @weather.now == 'sunny' && @planes.length < @capacity ? true : false
  end
end
