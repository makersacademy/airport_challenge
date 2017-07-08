require 'pry'
class Plane

  def take_off
    fail("Plane already airborne!") unless @landed
    @landed = false
  end

  def land_at airport
    @landed = true
  end

  def landed?
    @landed
  end

end
