class Plane 
  
  attr_reader :location
  
  def takeoff(conditions)
    if @location == "In-flight"
      fail "The plane is already in the air."
    elsif conditions.stormy? == true
      fail "The weather is too stormy to take off at the moment."
    else
      @location.docked_planes.delete_if { |plane| plane == self }
      puts "#{self} has departed from #{@location}."
      @location = "In-flight"
    end
  end
  
  def land(airport, conditions)
    if airport.full? == true 
      fail "Cannot land at a full airport."
    elsif @location.class == Airport
      fail "The plane is already docked at an airport."
    elsif conditions.stormy? == true
      fail "The weather is too stormy to land at the moment."
    else 
      airport.docked_planes << self
      @location = airport
    end
  end

  def in_airport?
  end

end
