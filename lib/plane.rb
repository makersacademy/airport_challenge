class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def take_off
    @landed ? true : false
  end

  # def landed??
  #   true
  # end

end
