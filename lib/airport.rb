require_relative 'airplane'

class Airport

  def land(airplane)
    @airplane = airplane
  end

  def take_off
    @airplane
  end

end
