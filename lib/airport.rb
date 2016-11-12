require_relative 'plane.rb'

class Airport

  def land(plane)
    @plane = []
    @plane << plane
    @plane
  end

  def take_off(plane)
    fail "This plane hasn't landed at this airport!" if !confirm_landed(plane)
    @plane.delete(plane)
    plane
  end

  def confirm_landed(plane)
    return false if @plane.nil?
    @plane.include?(plane)
  end

end
