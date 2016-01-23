class Plane

  def to_land
    @on_ground = true
  end

  def landed?
    true if @on_ground
  end

end
