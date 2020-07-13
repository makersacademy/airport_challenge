require 'airport'

class Plane
  attr_accessor :landed

  def initialize(status = true)
    @landed = status
  end

end
