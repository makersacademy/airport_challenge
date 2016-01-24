require_relative 'weather'

module TakeoffLand

  def taking_off(flyer_lander, weather)
    raise "Too stormy to takeoff!" if weather.stormy?
    flyer_lander
  end

  def landing(flyer_lander, weather)
    raise "Too stormy to land!" if weather.stormy?
    flyer_lander
  end

end
