class Plane
  attr_reader :landed
  def initialize(landed = false)
    @landed = landed
  end

  def land
    unless @landed
      @landed = true
      return true
    end
    false
  end

  def takeoff
    if @landed
      @landed = false
      return true
    end
    false
  end
end