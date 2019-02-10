require "plane.rb"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @planes << Plane.new
  end

  def takeoff
    weather
    if weather == "stormy"
      fail "Cannot takeoff during storms"
    end
    @planes.pop
  end

  def weather

  end
end
