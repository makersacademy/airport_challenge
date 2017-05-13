require './lib/plane'

class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    if plane.landed?
      raise "Not this time buddy, you only land once!"
    elsif plane.taken_off?
      raise "Not this time buddy, you can't land a taken off plane!"
    else
      plane.flight_status = :landed
      @landed_planes << plane
    end
  end

  def takeoff(plane)
    if plane.flying?
      raise "Not this time buddy, you can't takeoff a flying plane!"
    elsif plane.taken_off?
      raise "Not this time buddy, you can't takeoff a taken off plane!"
    else
      plane.flight_status = :taken_off
      @landed_planes.delete(plane)
    end
  end

  def present?(plane)
    @landed_planes.include?(plane)
  end

end
