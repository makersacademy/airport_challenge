require './docs/airport.rb'

class Plane
  def initialize(airborne = true)
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

attr_writer :airborne

  def ground_plane
    self.airborne = false
  end
  def fly_plane
    self.airborne = true
  end
end
