# require "./airport.rb"

class Plane
  attr_reader :plane

  def initialize(plane = :LX810)
    @plane = plane
  end
end
