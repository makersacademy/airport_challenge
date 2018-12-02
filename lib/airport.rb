require_relative 'airplane'

class Airport

  def land(airplane)
    @airplane = airplane
  end

  def take_off
    @airplane unless stormy? == 1
  end

  def stormy?
    rand(0..1)
  end
  # 0 is sunny , 1 is stormy

end
