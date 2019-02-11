require "plane.rb"

class Airport

  attr_reader :planes

  def initialize
    @planes = [Plane.new]
  end

  def takeoff
    fail "Cannot takeoff during storms" if stormy? == true
    @planes.pop
  end

  def land
    fail "Cannot land when airport is full"
  end

  def stormy?
    [true, false, false, false].sample
  end
end
