class Airplane

  def initialize
    @current_status = "grounded"
  end

  def show_current_status
    @current_status
  end

  def request_permission_to_land
  end

  def take_off
    @current_status = "airborne"
  end

  def land
    @current_status = "grounded"
  end

end
