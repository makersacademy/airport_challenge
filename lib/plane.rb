
class Plane
  attr_reader :landing, :takeoff, :flying
  def initialize
    @flying, @landing, @takeoff = true, false, false
  end

  def land
     @takeoff, @landing = false,  true
  end

  def landed
    @flying = false
  end

  def take_off
    raise "a flying plane cannot take off" if @flying
    @flying, @takeoff = true, true
  end

end
