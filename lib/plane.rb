class Plane
  def initialize
    @landed = true
  end

  def landed?  # remove = true and replace with attr_reader
    @landed = true
  end

  def taken_off
    @landed = false
  end
end
