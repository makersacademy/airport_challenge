class Airplane
  def show_current_status
    @current_status
  end
  def take_off
    @current_status = "airborne"
  end
end
