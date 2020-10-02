class Plane
  def flying
    @status = true
  end

  def grounded
    @status = false
  end

  def in_air?
    @status
  end
end 
