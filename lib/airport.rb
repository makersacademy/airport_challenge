
class Airport
  DEFAULT_CAPACITY = 15

  def initialize(weather, capacity = DEFAULT_CAPACITY )
    @weather = weather.weather_status
    @capacity = capacity
    @airplanes = []
  end

  def land(plane)
    if @airplanes.length < @capacity
      @airplanes.push(plane)
      return @airplanes.length
    else
      raise StandardError.new("Airport at full capacity")
    end
  end

  def take_off(plane)
    if @weather != "stormy"
      @airplanes.delete(plane)
      return @airplanes.length
    else
      raise StandardError.new("The storm is preventing us to takeoff")
    end
  end

end
