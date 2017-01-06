class Plane
  def initialize
    @landed = true
  end

  def land airport
    #check weather
  end

  def take_off
    @landed = false
  end

  def landed?
    @landed
  end
end
