class Plane


  def to_land
    @on_ground = true
  end

  def confirm_landed
    landed?
  end

  def landed?
    true if @on_ground
  end

end
