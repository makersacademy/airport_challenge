class Plane

  attr_accessor :landed

  def initialize(landed = false)
    @landed = landed
  end

  def land
    raise "Plane is already landed in an airport!" if @landed
    @landed = true
  end

  def take_off
    raise "Plane is already in air!" unless @landed
    @landed = false
  end

end
