class Airport

  def initialize
    @planes = []
  end

  def accept_plane plane
    fail "Airport is full" if @planes.length == 6
    @planes << plane
  end

end
