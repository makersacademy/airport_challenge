class Plane

  def is_flying?
    flying? == true
  end

  def is_landed?
    flying? == false
  end

  def set_flying
    self.flying=(true)
  end

  def set_landed
    self.flying=(false)
  end

  private

  def flying=(boolean)
    @flying = boolean
  end

  def flying?
    @flying
  end

end
