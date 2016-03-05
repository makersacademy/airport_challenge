class Airport

attr_reader :planes

def initialize
@planes = nil
end


  def arrive(plane)
    @planes = plane
  end


end