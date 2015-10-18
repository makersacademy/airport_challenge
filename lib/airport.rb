require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane

  def land(plane)
    fail 'Landing not possible, airport full.' if @plane
    fail 'Landing not possible, too stormy.' if stormy?
    @plane = plane
  end

  def take_off
    fail 'Take-off not possible, too stormy.' if stormy?
    plane
  end

  private

  def stormy?


  end

end
