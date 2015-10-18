class Airport

  def initialize
    @airport = []
  end

  def landing(plane)
    raise 'airport is full' if @airport.length == 1
    @airport << plane
  end
  


end
