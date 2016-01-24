class Plane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    raise "This plane has already landed" if @landed
    @landed = true
  end

  def take_off
    raise "This plane has already left" unless @landed
    @landed = false
  end






end
