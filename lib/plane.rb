require_relative 'airport'

class Plane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def landed?
    @landed = true
  end

end
