class Airport

attr_reader :plane_array

def initialize
  @plane_array = []
end

  def land(plane)
  @plane_array << plane
  end

end
