class Plane
  FLYING = "In the air"

  def land_at airport
    raise InvalidStateError, "Not in the air" unless flying?
    return false unless airport.accept self

    @airport = airport
    true
  end

  def take_off
    raise InvalidStateError, "Can't take off in the air" if flying?
    return false if @airport.weather_report == "stormy"

    @airport = nil
    true
  end

  def flying?
    @airport.nil?
  end

  def location
    @airport.nil? ? FLYING : @airport.name
  end
end

class InvalidStateError < StandardError
end
