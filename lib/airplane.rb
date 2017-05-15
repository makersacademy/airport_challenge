class Airplane

  attr_reader :current_status

  def initialize(current_status = "airborne")
    @current_status = current_status
  end

  def check_current_status
    @current_status
  end

  def take_off
    @current_status = "airborne"
  end

  def land
    @current_status = "grounded"
  end

end
