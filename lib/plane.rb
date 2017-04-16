class Plane

  attr_reader :landed

  def land
    landing_process
    confirm_landing
  end

  def take_off
    take_off_process
    confirm_take_off
  end

  def confirm_landing
    landed ? "This plane has landed." : "This plane has not landed."
  end

  def confirm_take_off
  end

  private

  attr_writer :landed

  def landing_process
    self.landed = true
  end

  def take_off_process
    self.landed = false
  end

end
