require_relative 'plane.rb'

class Airport

  def land(plane)
    @plane = []
    @plane << plane
    @plane
  end

  def confirm_landed(plane)
    fail "No plane landed!" if @plane.nil?
    @plane.include?(plane)
  end

end
