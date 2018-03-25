class Airport


  def hangar
    []
  end

  def stormy?
    rand(20) > 18
  end

end

class Airplane

  def land(airport)
    raise("Too stormy!") if airport.stormy?
  end

  def take_off
  end

end
