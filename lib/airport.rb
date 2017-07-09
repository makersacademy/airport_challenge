class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  # def landed?(plane)
  #   planes.include? plane ? "The plane has landed" : "The plane has not landed"
  # end

end
