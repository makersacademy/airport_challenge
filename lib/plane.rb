class Plane

  attr_accessor :status, :location

  def initialize
    @status = "Airbourne."
  end

  def land(where_to_land)
    @location = where_to_land
    raise("Airport full.") if @location.full?
    raise("Plane has already landed.") if landed?
    raise("Landing prohibited due to weather conditions.") if @location.stormy?
    @location.hangar.push(self)
    @status = "Landed."

  end

  def take_off
    raise("Plane has left the hangar and is in the air.") if airbourne?
    raise("Takeoff prohibited due to weather conditions.") if @location.stormy?
    @status = "Airbourne."
    @location.hangar.delete(self)
    puts "#{self} has left the hangar and is airbourne."
  end

  def airbourne?
    @status == "Airbourne."
  end

  def landed?
    @status == "Landed."
  end

end
