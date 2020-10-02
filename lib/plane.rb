class Plane
  def initialize(status = false)
    @status = status
  end

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
