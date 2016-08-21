require_relative 'airport'
require_relative 'weather'

class Plane
  attr_accessor :landed #allows reading and writing of @landed

  def initialize
    @landed = false
  end



end
