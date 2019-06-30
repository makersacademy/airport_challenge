class Airplane

  def is_flying
    @flying = true
  end

  def flying?
    @flying == true
  end

  def has_landed
    @flying = false
  end
end
