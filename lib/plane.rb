# Custom errors for use with Plane class:
class PlaneStatusError < StandardError; end

class Plane
  attr_reader(:flight_no, :capacity)

  DEFAULT_CAPACITY = 95

  def initialize(capacity = DEFAULT_CAPACITY, flight_no: 'DF-1301')
    @capacity = capacity
    @flight_no = flight_no
    @status = 'currently in the air'
  end

  def land(at_airport)
    raise(PlaneStatusError, "#{self} is already landed!") unless flying?
    at_airport.planes_currently_landed << self
    @status = "currently landed at #{at_airport.iata_code}."
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