class Plane
  attr_reader :status

  def confirm_take_off
    status
  end

  def status
    "Safe take off"
  end
end
