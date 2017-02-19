class Airport

  def initialize(forecast)
    @forecast = forecast
  end

  def land(airplane)
    return if @forecast == true
    @airplane = airplane
    "The plane has landed."
  end

  def take_off
    return if @forecast == true || @airplane == nil
    @airplane = nil
    "The plane has taken off."
  end

end
