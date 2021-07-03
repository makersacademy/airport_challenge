class Airport
  def initialize(capacity = 1)
    @airplanes = []
    @capacity = capacity
    @weather = "sunny"
  end
  
  def land(airplane)
    raise "Airplane already in airport" if in_airport?(airplane)
    raise "Airplane already landed in an airport" if airplane.landed?
    if !full_airport? && @weather != "stormy"
      @airplanes.push(airplane)
      airplane.land
    end
  end

  def take_off(airplane)
    raise "Airplane not in airport" if !in_airport?(airplane)
    if @weather != "stormy"
      @airplanes.delete(airplane)
      airplane.take_off
    end  
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

  private 

  def full_airport?
    @airplanes.length == @capacity
  end

  def in_airport?(airplane)
    @airplanes.include?(airplane)
  end
end