require "plane.rb"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @planes << Plane.new
  end

  def takeoff
    @planes.pop
  end

  def weather

  end
end
