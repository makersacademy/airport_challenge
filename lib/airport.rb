class Airport

  def initialize
    @airplanes = []
  end

  def get_airplanes
    @airplanes
  end

  def confirm_landing
#    if airplanes.count == 1
#      'the airplane has landed'
#    end
  end

  def accept_landing(airplane)
    @airplanes << airplane
  end
end
