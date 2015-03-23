class Plane

  def initialize
    in_air!
  end

  def flying?
    @flying
  end

  def landed!
    @flying = false
  end

  def in_air!
    @flying = true
  end

end


  # def take_off?
  #   true
  # end

  # def landing?
  #   @landing
  # end


  # def on_ground #the plane is not flying
  #   @on_ground
  # end

  # def flight_status
  #   if in_flight?
  #      flying
  #   elsif plane.take_off?
  #      taking_off
  #   elsif plane.landing?
  #      landing
  #   elsif plane.on_ground?
  #      on_ground
  #   end
  #  end

  #def delay_landing
  #end
  # not sure if delayed landing should be initiated by plane or by airport
  # even though this will be affected by weather
