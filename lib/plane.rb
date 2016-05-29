require_relative 'airport'

class Plane

  def initialize
    @landed = false
  end

  def is_landed
    @landed = true
  end

  def not_landed
    @landed = false
  end

  def landed?
    @landed
  end

end
