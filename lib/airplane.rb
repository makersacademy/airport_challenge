class Airplane

  def show_current_status
    @current_status
  end

  def take_off
    @current_status = "airborne"
  end

  def land
    @current_status = "grounded"
  end

end
