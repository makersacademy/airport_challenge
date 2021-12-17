class Plane 
  
  attr_reader :location
  
  def takeoff
    fail "The plane is already in the air." if @location == "In-flight"
    @location.docked_planes.delete_if { |plane| plane == self }
    puts "#{self} has departed from #{@location}."
    @location = "In-flight"
  end
  
  def land(airport)
    if airport.full? == true 
      fail "Cannot land at a full airport."
    elsif @location.class == Airport
      fail "The plane is already docked at an airport."
    else 
      airport.docked_planes << self
      @location = airport
    end
  end

  def in_airport?
  end

end
