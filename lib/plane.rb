class Plane

  def flying?
    @flying
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


end
