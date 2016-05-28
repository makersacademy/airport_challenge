require_relative 'airport'

class Plane

  attr_reader :landed

  # def initialize
  #   @landed = true
  # end

  def land(airport)
    @landed = true
    @location = airport
  end

  def is_where?
    @location
  end

end