require_relative 'plane'
#require_relative 'weather'

class Airport
  attr_reader :planes, :weather


  def initialize
    @planes = []
    @weather = weather
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

  private





end
