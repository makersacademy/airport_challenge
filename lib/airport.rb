require_relative 'airplane'

class Airport

  def land(airplane)
    @airplane = airplane unless stormy?
  end

  def take_off
    @airplane unless stormy?
  end

  def stormy?
    rand(0..1) == 1 ? true : false
  end
  # 0 is sunny , 1 is stormy

end
