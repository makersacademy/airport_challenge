class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def take_off
    raise "Plane cannot take off, it's already flying!" if !landed
    @landed = false
  end

  # def landed??
  #   true
  # end

end
