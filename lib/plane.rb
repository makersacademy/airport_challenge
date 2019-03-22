require_relative 'weather'

class Plane
attr_reader :landing
attr_reader :take_off
attr_reader :flying

  def initialize
    @landing = false
    @take_off = false
    @flying = false
  end

  def landing?
    true unless @landing == false
  end

  def take_off
    @take_off = true
  end

  def taken_off
    @take_off = false
    @flying = true
  end

  def land
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
