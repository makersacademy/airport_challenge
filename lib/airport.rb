class Airport
#  attr_reader :forecast

  def land(airplane)
    @airplane = airplane
    return "The plane has landed."
  end

  def take_off(forecast)
    unless @airplane == nil
      if forecast#== true
        @airplane = nil
        "The plane has taken off."
      end
    end
  end

end
