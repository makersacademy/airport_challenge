class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def landed
    @plane.push plane
  end

  def takenoff
    @plane.delete plane
  end

end
