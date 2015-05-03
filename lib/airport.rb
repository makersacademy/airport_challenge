class Airport
  def initialize
    @planes = []
  end
  def accept_plane plane
      fail "Airport is full, plane cannot land" if @planes.length == 6
      @planes << plane
  end
end
