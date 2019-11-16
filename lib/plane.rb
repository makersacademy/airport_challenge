class Plane
  FLYING_STRING = "In the air"
  attr_reader :location

  def initialize
    @location = FLYING_STRING
  end

  def land_at airport
    @location = airport.name
  end

  def take_off
    raise InvalidStateError, "Can't take off in the air" if flying?
    @location = FLYING_STRING
  end

  def flying?
    @location == FLYING_STRING
  end
end

class InvalidStateError < StandardError
end
