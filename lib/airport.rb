require 'plane'

class Airport 
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "That plane has left the airport!" if empty?
    @planes.pop
  end

  def empty?
    @planes.empty?
  end

  def weather
  end
end
