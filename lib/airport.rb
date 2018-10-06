class Airport

attr_accessor :hanger

  def initialize
    @hanger = []
  end

  def land(plane)

  @hanger << plane
  end

  def total_planes(plane)
  @hanger.include?(plane)

  end

end

class Plane


end
