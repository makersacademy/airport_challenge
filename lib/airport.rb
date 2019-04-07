require_relative 'planes'

class Airport
  attr_reader :plane

  def land
    raise "Airport full" if full?
    raise "Too stormy to land" if stormy?
    @plane = 'plane'
  end

  def take_off
    raise "Too stormy to take off" if stormy?
  end

private

  def stormy?
    rand(1..10) > 6
  end

  def full?
    @plane = 'plane'
  end

end
