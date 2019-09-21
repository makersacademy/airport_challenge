require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize
    @planes =[]
  end

  def land(plane)
    @planes << plane
    puts @planes
  end

  def takeoff
  end

end
