class Plane
  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def change_status
    flying? ? @flying = false : @flying = true
  end

end
