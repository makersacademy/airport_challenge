require_relative 'airport'

class Plane

  attr_reader :landed

  # def initialize
  #   @landed = true
  # end

  def land(airport)
    @landed = true
  end

end