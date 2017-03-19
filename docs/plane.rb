require './docs/airport.rb'

class Plane
  def initialize(plane="plane", airborne = true)
    @name = plane
    @airborne = airborne
  end

attr_reader :airborne

  def ground
    @airborne = false
  end

  def fly
    @airborne = true
  end


end
