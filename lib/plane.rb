class Plane

  attr_accessor :status, :location

  def initialize
    @status = "Airbourne."
  end

  def land(where_to_land)
    @location = where_to_land
    @location.hangar << self
    @status = "Landed."

  end

  def take_off
    @status = "Airbourne."
    @location.hangar.delete(self)
    puts "#{self} has left the hangar and is airbourne."
  end



end
