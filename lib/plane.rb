class Plane
  attr_reader :taken_off, :in_apron

  def land?
    @in_apron = true
  end

  def taken_off?
    @in_apron = false
  end

end
