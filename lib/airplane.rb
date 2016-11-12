class Airplane

  #TAKE OFF
  def take_off
    flying? == true
  end

  #IN FLIGHT

  def flying?

  end

  #LANDING

  def land_at_airport

  end

  def landed?
    true
  end

  def airplane_status
    return "landed" if landed?
    return "flying" if !landed?
  end

end
