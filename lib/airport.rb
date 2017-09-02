require_relative 'plane'

class Airport

attr_reader :runway

  def initialize
    @runway = []
  end

  def runway_traffic
    @runway
  end

  def land(plane)
    @runway << plane
  end

  def take_off(plane)
    @runway.include?(plane) ? @runway.delete(plane) : return
  end

end
