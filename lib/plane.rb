class Plane
  attr_reader :flying

  def flying?
    @flying
  end

  def is_flying
    @flying = true
  end

  def not_flying
    @flying = false
  end

end
