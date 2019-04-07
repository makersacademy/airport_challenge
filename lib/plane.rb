class Plane
  attr_reader :taken_off, :landed

  def land?
    @landed = true
  end

  def taken_off?
    @taken_off = true
  end

end
