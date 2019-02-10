class Plane

  attr_accessor :status, :location

  def initialize
    @status = "Airbourne."
  end

  def land(where_to_land)
    @location = where_to_land
    raise("Plane has already landed.") if @status != "Airbourne."
    # raise("Landing prohibited due to weather conditions.") if @location.weather == "stormy"
    @location.hangar.push(self)
    @status = "Landed."

  end

  def take_off
    raise("Plane has left the hangar and is in the air.") if @status != "Landed."
    # raise("Takeoff prohibited due to weather conditions.") if @location.weather == "stormy"
    @status = "Airbourne."
    @location.hangar.delete(self)
    puts "#{self} has left the hangar and is airbourne."
  end



end
