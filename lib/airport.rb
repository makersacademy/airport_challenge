class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def stormy?
    rand(20) > 18
  end

end

class Airplane

  def land(airport)
    raise("Too stormy!") if airport.stormy?
    airport.hangar.push(self)
  end

  def take_off(airport)
    airport.hangar.delete(self)
  end

end
