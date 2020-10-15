require_relative 'plane.rb'
class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end
  def land(plane)
    @hangar << plane
  end
end

 a = Airport.new
