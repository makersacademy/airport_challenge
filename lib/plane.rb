class Plane

  attr_reader :landed

  def land
    landing_process
    confirm_landing
  end

  def take_off
    self.landed = false
  end

  def confirm_landing
    landed ? "This plane has landed." : "This plane has not landed."
  end

  private

  attr_writer :landed

  def landing_process
    self.landed = true
  end

end
