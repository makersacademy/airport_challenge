class Plane
  attr_reader :at_airport

  # need to instruct a plane to land at a particular airport
  # so need to accept the airport as an argument
  def land(stormy = false)
    stormy ? raise("Weather stormy -> can't land!") : @at_airport = true
  end

  def take_off(stormy = false)
    stormy ? raise("Weather stormy -> can't take off!") : @at_airport = false
  end

end
