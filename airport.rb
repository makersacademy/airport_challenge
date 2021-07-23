class Airport
  attr_accessor :airport

  def initialize
  @airport = []
  end

  def land(plane)
  @airport << plane
  end

  def take_off(plane)
    "#{plane} has taken off and is no longer in the airport"
   
   
  end


  

end