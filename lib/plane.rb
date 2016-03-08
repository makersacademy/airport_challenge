class Plane
  attr_reader :airport

  def land airport
    fail "Already landed!" if landed?
    @airport = airport
  end

  def landed?
    !!airport
  end

  def take_off at_airport
    fail "Wrong airport giving instructions" unless correct? at_airport
    @airport = nil
  end

  private

  def correct? at_airport
    at_airport == airport
  end
end
