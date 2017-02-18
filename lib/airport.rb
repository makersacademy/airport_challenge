class Airport

  def land(airplane)
    @airplane = airplane
    return "The plane has landed."
  end

  def take_off
    if @airplane != nil
      @airplane = nil
      "The plane has taken off."
    end
  end

end
