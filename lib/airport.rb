require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
    "#{plane} has successfully departed." unless @planes.include? plane
  end

end