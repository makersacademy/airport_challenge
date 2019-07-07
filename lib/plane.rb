class Plane

  def flying
    @status = true
  end

  def landed
    @status = false
  end

  def flying?
    @status 
  end

end
