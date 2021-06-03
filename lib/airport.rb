class Airport
  def initialize(capacity = 1)
    @airplanes = []
    @capacity = capacity
    @weather = "sunny"
  end
  
  def land(airplane)
    if @airplanes.length < @capacity && @weather != "stormy"
      @airplanes.push(airplane)
    end
  end

  def take_off(airplane)
    @airplanes.delete(airplane)
  end

  def get_airplanes
    @airplanes
  end

  def get_capacity
    @capacity
  end

  def set_weather(weather)
    @weather = weather
  end
end