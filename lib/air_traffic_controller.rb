class AirTrafficController

  def is_stormy?(weather)
    # weather = Weather.new
    p weather.is_stormy?
    p "dolphin face"

  end

  def instruct_to_land(plane, airport)
    return if is_stormy?
    return if airport.full?
    plane.land
    airport.register_landing(plane)
  end

  def instruct_to_take_off(plane, airport)
    return if is_stormy? == true
    plane.take_off
  end
end
