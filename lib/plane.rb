class Plane
  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def status
    flying? ? :flying : :landed
  end

  def land
    @flying = false
  end
end
