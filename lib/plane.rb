# Custom errors for use with Plane class:
class PlaneStatusError < StandardError; end

class Plane

  def initialize
    @status = 'currently in the air'
  end

  def land(at_airport)
    raise(PlaneStatusError, "#{self} is already landed!") unless flying?
    at_airport.planes_currently_landed << self
    @status = "currently landed at #{at_airport}."
  end

  def take_off(from_airport)
    raise(PlaneStatusError, "#{self} is already in the air!") if flying?
    from_airport.planes_currently_landed.delete(self)
    @status = 'currently in the air'
  end

  private

  def flying?
    @status == 'currently in the air'
  end

end
