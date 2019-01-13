require_relative 'plane'

class Airport
  attr_reader :planes, :sunny, :stormy

  def initialize
    @planes = []
    @conditions = rand(1..10) < 8 ? :sunny : :stormy
  end

  def land(plane)
    @planes << plane
  end

  def weather
    @conditions
  end

  def takeoff(*)
    if weather == :stormy
      fail "Sorry, it is too stormy to fly."
    elsif weather == :sunny
      @planes.pop
    end
  end
end
