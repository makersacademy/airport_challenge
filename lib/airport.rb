class Airport

  def initialize
    @dock = []
  end

  def accept_plane(plane)
    @plane = plane
    @dock.push(@plane)
    return "#{@plane} successfully docked."
  end

end
