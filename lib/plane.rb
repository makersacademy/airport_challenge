class Plane
  attr_reader :landed
  alias_method :landed?, :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def taken_off
    @landed = false
  end

  def flying_status
    if @landed == false
      'Flying'
    else
      'Landed'
    end
  end
end
