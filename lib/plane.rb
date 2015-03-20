class Plane
  def initialize
    @landed = true
  end

  def landed?
    @landed = true
  end #remove = truw and replace with attr_reader

  def taken_off
    @landed = false
  end
end
