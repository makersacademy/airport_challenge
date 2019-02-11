require "plane.rb"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @planes << Plane.new
  end

  def takeoff
    stormy?
    fail "Cannot takeoff during storms" if stormy? == true
    @planes.pop
  end

  def stormy?

  end
end
