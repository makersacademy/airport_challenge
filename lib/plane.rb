class Plane


  def initialize(flying=true)
    @flying = flying
  end

  def flying
    @flying = true
  end

  def grounded
    @flying = false
  end


end
