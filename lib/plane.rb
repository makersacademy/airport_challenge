class Plane
  attr_reader :in_flight

  def initialize
    @in_flight = false
  end

  def take_off
    @in_flight? (fail "Already in flight" ) : (@in_flight = true)
  end

  def land
    @in_flight? (@in_flight = false) : (fail "Already touched down" )
  end
end