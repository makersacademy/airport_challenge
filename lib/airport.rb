require_relative 'Airplane'

class Airport

  def initialize
    @airplane = []
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
    @airplane.count >= 20
  end

end
