require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land plane
    @planes << plane
    plane.lands!
  end

  def take_off plane
    @planes.delete plane
    plane.takes_off!
  end
end