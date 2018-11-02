# require "./lib/plane.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def landing(plane)
    @planes << plane
  end

  def take_off
  end

end
