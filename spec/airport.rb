class Airport
  attr_reader :plane
  
  def land
    fail 'Plane has already landed' if @plane?
    @plane
  end

  def landed?(plane)
    @plane = plane
  end 
end
