class Plane

  attr_reader :at_airport

  def land
  end

  def take_off(stormy = false)
    stormy ? raise("Weather stormy -> can't take off!") : @at_airport = false
  end

end
