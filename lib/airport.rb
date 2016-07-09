class Airport

  def initialize
    @airplanes = []
  end

  def get_airplanes
    @airplanes
  end

  def accept_takeoff(airplane)
    @airplanes.pop
    "#{airplane} has successfully taken off."
  end

  def accept_landing(airplane)
    @airplanes << airplane
    "#{airplane} has successfully landed."
  end
end
