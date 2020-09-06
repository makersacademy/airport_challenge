class Plane
  attr_accessor :location
  attr_accessor :last_airport

  def initialize
    @location = "in the air"
    @last_airport = "none"
  end

  def land(airport)
    
    @location = airport
  end

  def take_off(airport)
    
    @last_airport = airport
    @location = "in the air"
    location?
  end

  def location?
    return "The plane is #{@location}."
  end

end