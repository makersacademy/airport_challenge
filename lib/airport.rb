require_relative './plane.rb'

class Airport

  def allows_for_landing
    Plane.new
  end

  def allows_for_take_off
    Plane.new
  end
end
