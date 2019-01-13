require_relative 'plane'

class Airport
  attr_reader :planes, :sunny, :stormy

  def initialize
    @planes = []
    @conditions = rand(1..10) < 8 ? :sunny : :stormy
  end

  def land(plane)
    if weather == :stormy
      fail "Sorry, you can't land due to the storm."
    elsif weather == :sunny
      @planes << plane
    end
  end

  def takeoff(*)
    if weather == :stormy
      fail "Sorry, the storm is preventing takeoff."
    elsif weather == :sunny
      @planes.pop
    end
  end

  def weather
    @conditions
  end
end
