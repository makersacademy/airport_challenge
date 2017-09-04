
class Airplane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def takeoff
    @landed = false
  end
end
