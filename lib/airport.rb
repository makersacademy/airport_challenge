
class Airport
  attr_accessor :planes

  def park(plane)
    @planes << plane
  end
end
