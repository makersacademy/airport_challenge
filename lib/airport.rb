require_relative 'airplane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def capacity
    @capacity
  end

  def land_plane(airplane)
    fail "Cannot land due to inclement weather." if weather?
    airplane.land
  end

  private

  def weather?
    true
  end

end
