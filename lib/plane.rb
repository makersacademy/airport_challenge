class Plane
  attr_writer :plane_landed, :plane_taking_off

  def may_i_land?(permission)
    if permission == true 
      return @plane_landed= true 
    else
      return @plane_landed= false
    end
  end

  def may_i_take_off?(permission)
    if permission == true 
      return @plane_taking_off= true 
    else
      return @plane_taking_off= false
    end
  end

  def landed?
    @plane_landed
  end

  def took_off?
    @plane_taking_off
  end

end