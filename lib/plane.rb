require_relative '../lib/airport'

class Plane
  attr_accessor :landed

  def landed
    @landed = true
  end

  def flying
    @landed = false
  end

  def already_landed?
    @landed ? true : false
  end
end
