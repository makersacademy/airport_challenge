# require_relative 'airport'

class Plane
  attr_reader :location

  def land
    fail "Plane already grounded" if grounded?

    @location = :grounded
  end

  def take_off
    fail "Plane already airborne" if flying?

    @location = :airborne
  end

  def flying?
    @location == :airborne
  end

  def grounded?
    @location == :grounded
  end

end
