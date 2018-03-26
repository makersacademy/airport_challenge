class Airport

  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def stormy?
    Weather.new.stormy?
  end

end

class Airplane

  def land(airport)
    raise("Too stormy!") if airport.stormy?
    airport.hangar << self
  end

  def take_off(airport)
    raise("Im not at your airport, fools!") unless airport.hangar.include?(self)
    airport.hangar.delete(self)
  end

end

class Weather
  def stormy?
    rand(20) > 18
  end
end
