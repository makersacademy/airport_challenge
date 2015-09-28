class Plane

  def initialize
    @airborne = true
  end

  def land!
    @airborne = false
  end

  def take_off!
    @airborne = true
  end

  def flying_status
    @airborne ? 'flying' : 'landed'
  end
end
