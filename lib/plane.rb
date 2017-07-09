require_relative 'airport'

class Plane
  attr_accessor :landed

  def initialize
    @landed = true
  end

  # def landed
  #   true
  # end
  #
  # def take_off
  #   false
  # end

end
