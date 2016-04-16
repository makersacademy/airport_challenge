class Airport

  require_relative 'plane'

  def land(plane)
    raise 'Airport full' if airport_full
    @plane = plane
    plane.landed
  end

  private

  def airport_full
    !@plane.nil?
  end

end