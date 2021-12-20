class Plane 
  
  attr_reader :location
  def initialize
    @location = Airport.new
  end

  def takeoff(conditions)
    fail "The plane is already in the air." if @location == "In-flight"
    fail "The weather is too stormy to take off at the moment." if conditions.stormy? == true
  
    @location.docked_planes.delete_if { |plane| plane == self }
    puts "#{self} has departed from #{@location}."
    @location = "In-flight"
  end
  
  def land(airport, conditions)
    fail "Cannot land at a full airport." if airport.full? == true
    fail "The plane is already docked at an airport." if @location.class == Airport
    fail "The weather is too stormy to land at the moment." if conditions.stormy? == true
    
    airport.docked_planes << self
    @location = airport
  end

end
