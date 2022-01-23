class Plane

  def land(ap)
    if ap.get_capacity > ap.get_current && ap.get_weather != "stormy"
      ap.add_flight
      return "landed!"
    else
      return "no landing for now!"
      end
  end

  def take_off(ap)
    if ap.get_current > 0 && ap.get_weather != "stormy"
      ap.remove_flight
      return "took off! no longer in the airport"
    else
      return "cannot take-off"
    end
  end

end