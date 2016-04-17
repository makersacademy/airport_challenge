

class Plane
  attr_reader :location, :flying, :crashed

  def initialize
    @location = 'where eagles soar'
    @flying = true
    @crashed = false
  end

  def broadcast_location
    crashed? ? "... ..." : location
  end

  def crashed?
    crashed
  end

  def flying?
    flying
  end

  def land(location = "a field")
    fail "You yanking crank, I'm on the effin' tarmac" unless flying
    @location = location
    @flying = false
    location == "a field" ? crash : nil
  end

  def take_off(take_off_location)
    fail "I'm already up here mate" if flying
    fail "This birds got no wings" if crashed
    fail "You frickin' loopy, I'm in #{location}" unless take_off_location == location
    @location = 'where eagles soar'
    @flying = true
    nil
  end

  private
  def crash
    rand(2) == 1 ? @crashed = true : @crashed = false
    return "Crash landing"
  end

end
