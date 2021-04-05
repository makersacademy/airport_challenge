class Plane
  attr_accessor :airport
  
  def initialize
    @airport
  end
  
  def location(airport_number)
    @airport = airport_number
  end  

  def landed?
    @airport
  end
end
