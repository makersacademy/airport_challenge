# require "plane"

class Airport
  attr_accessor :runway
  def initialize 
    @runway = []
  end

  def land(plane)
    @runway << plane
  end
end
