class Airport

  def initialize(forecast)
    @forecast = forecast
  end

  def land(airplane)
    return if @forecast == true
    return "Airport full." if full?
    @airplanes = airplane
    "The plane has landed."
  end

  def take_off
    return if @forecast == true || @airplanes == nil
    @airplanes = nil
    "The plane has taken off."
  end

  def full?
    true unless @airplanes == nil
  end

end
