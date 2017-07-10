require 'pry'
class Plane

  def take_off
    fail("Plane already airborne!") unless @landed
    @landed = false
  end

  def land_at airport
    fail("Plane already landed!") if @landed
    @landed = true
  end

  def landed?
    @landed
  end

end
