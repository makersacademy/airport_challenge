class Plane
  attr_writer :plane_landed, :plane_taking_off

  def may_i_land?(permission)
    permission == true ? @plane_landed= true : @plane_landed= false
  end

  def may_i_take_off?(permission)
    permission == true ? @plane_taking_off= true : @plane_taking_off= false
  end

  def landed?
    @plane_landed
  end

  def took_off?
    @plane_taking_off
  end

end