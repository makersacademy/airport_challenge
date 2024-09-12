
class Airport
  DEFAULT_CAPACITY = 15

  def initialize(weather, capacity = DEFAULT_CAPACITY )
    @weather = weather.weather_status
    @capacity = capacity
    @airplanes = []
  end

  def land(plane)
    if @airplanes.length < @capacity && !stormy?
      @airplanes.push(plane)
      return @airplanes.length
    else
      raise StandardError.new("Airport at full capacity") if @airplanes.length >= @capacity
      raise StandardError.new("The storm is preventing us to land") if stormy?
    end
  end

  def take_off(plane)
    if !stormy?
      @airplanes.delete(plane)
      return @airplanes.length
    else
      raise StandardError.new("The storm is preventing us to takeoff")
    end
  end

  def stormy?
    @weather == "stormy"
  end

end
