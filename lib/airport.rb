require_relative 'plane'

class Airport
  attr_reader :planetoadd
  def initialize
    @planetoadd = []
  end

  def land
    Plane.new
  end

  def add(plane)
    @planetoadd << plane
  end

  def take_off(plane)
    @planetoadd.pop
  end
end
