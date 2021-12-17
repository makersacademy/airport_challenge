require_relative "airport"

class Plane
  attr_reader :location
  def initialize
    @location = :air
  end

  def ground
    @location = :ground
  end

end
