require_relative 'weather'

class Plane
attr_reader :landing
attr_reader :take_off
attr_reader :flying
attr_reader :storm

  def initialize
    @landing = false
    @take_off = false
    @flying = false
  end

  def stormy?(weather)
    @storm = true if weather.check_for_storm
  end

  def landing?
    true unless @landing == false
  end

  def take_off
    fail "Can't take off in a storm" if storm == true
    fail "Flying plane can't take off" if flying == true
    @take_off = true
  end

  def taken_off
    @take_off = false
    @flying = true
  end

  def land
    fail "Can't land in a storm" if storm == true
    fail "Landed plane can't land again" if flying == false
    @landing = true
  end

  def landed
    @landing = false && @flying = false
  end

  def flying?
    @flying
  end

  def at_airport?
    true if @landing == false && @flying == false
  end

end
