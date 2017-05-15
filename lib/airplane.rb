class Airplane

  attr_reader :current_status

  def initialize(current_status = :airborne)
    @current_status = current_status
  end

  def take_off
    @current_status = :airborne
    self
  end

  def land
    @current_status = :grounded
    self
  end

end
