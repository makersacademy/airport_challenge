require_relative 'plane'

class Airport

  attr_accessor :conditions

  def initialize(conditions='clear')
    @planes = []
    @conditions = conditions
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    raise 'the weather is too stormy' if @conditions == 'stormy'
    @planes.pop
  end
end
