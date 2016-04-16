require_relative "plane"

class Airport

  def take_off
    @flying = true
  end

  def flying?
    @flying
  end

end
