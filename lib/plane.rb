require_relative './custom_errors'

class Plane
  attr_writer :cleared
  attr_reader :status

  def initialize
    @status = :airborne
    @cleared = false
  end

  def land(at_airport)
    raise(PlaneStatusError, "#{self} is already landed!") unless flying?
    raise(NoClearanceError) unless @cleared
    at_airport.planes_currently_landed << self
    @status = :landed
    @cleared = false

  end

  def take_off(from_airport)
    raise(PlaneStatusError, "#{self} is already in the air!") if flying?
    raise(NoClearanceError) unless @cleared
    from_airport.planes_currently_landed.delete(self)
    @status = :airborne
    @cleared = false
  end

  private

  def flying?
    @status == :airborne
  end

end
