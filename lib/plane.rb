class Plane

  def to_land
    @on_ground = true
  end

  def landed?
    true if @on_ground
  end

  def took_off
    @on_ground = false
  end

  def in_air?
    true unless @on_ground
  end

end
