class AirTrafficController

  def is_stormy?
    weather = Weather.new
    weather.is_stormy?
  end

  def instruct_to_land(plane, airport)
    if is_stormy? == true
      return
    end
    if airport.full?
      return
    end
    plane.land
    airport.register_landing(plane)
  end

  def instruct_to_take_off(plane, airport)
    if is_stormy? == true
      return
    end
    plane.take_off
  end
end
