class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def instruct_land(plane)
    @hangar.push(plane)
    plane
  end

  def instruct_takeoff(plane)
    @hangar.delete(plane)
    plane
  end

  def confirm_gone?(plane)
    !@hangar.include?(plane)
  end

end
