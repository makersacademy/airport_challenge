require_relative 'Airplane'

class Airport

DEFAULT_CAPACITY = 20

attr_reader :capacity

  def initialize
    @airplane = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise 'AIRPORT FULL - permission to land denied.' if full?

    @airplane << plane
  end

  def take_off
    @airplane.pop
  end

  private

  def full?
    @airplane.count >= capacity
  end

end
