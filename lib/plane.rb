class Plane
  attr_reader :taken_off

  def land?
    true
  end

  def taken_off?
    @taken_off = true
  end

end
