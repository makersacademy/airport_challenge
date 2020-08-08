class Plane
  attr_reader :flying

  def flying?
    @flying = true
  end

  def set_as_flying
    flying?
  end
end
