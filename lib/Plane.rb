require_relative 'Airport'

class Plane

  attr_reader :landed

  def initialize (status = true)
    @landed = status
  end

  def land
    @landed = true
  end

  def flying
    @landed = false
  end

end
