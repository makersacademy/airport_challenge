class Plane

  attr_reader :landed

  def land
    self.landed = true
    confirm_landing
  end

  def confirm_landing
    landed ? "This plane has landed." : "This plane has not landed."
  end

  private

  attr_writer :landed
end
