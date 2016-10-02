class Plane

#plane status

  def landed
    @working = false
  end

  def taken_off
    @working = true
  end

  def working?
    @working
  end

end
