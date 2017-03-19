require './docs/airport.rb'

class Plane
  def initialize(plane="plane", airborne = true)
    @name = plane
    @airborne = airborne
  end

attr_reader :airborne

  def ground
    ground_plane
  end

  def fly
    fly_plane
  end

private

  def ground_plane
    @airborne = false
  end
  def fly_plane
    @rairborne = true
  end
end
