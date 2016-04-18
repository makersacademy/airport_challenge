
class Plane

  def initialize(landed = false)
    @landed = landed
  end

  def land
    @landed = true
  end

  def depart
    @landed = false
  end

  def in_airport?
    landed
  end

  private
  attr_accessor :landed

end