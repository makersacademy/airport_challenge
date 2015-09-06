class Plane

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def take_off
    @airborne
  end

  def land!
    @airborne = false
  end

  def flying_status
    if @airborne
      'flying'
    else
      'landed'
    end
  end
end
