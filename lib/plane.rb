class Plane
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def land(airport)
    raise("Warning: plane is not airborne") if @location != "airborne"

    raise("Cannot land: airport is closed") if airport.status == "closed"

    @location = airport
    # airport.receive(self)
  end

  def takeoff(airport)
    raise("Warning: plane is already airborne") if @location == "airborne"

    raise("Warning: plane is not at that airport") if @location != airport

    raise("Cannot take off: airport is closed") if airport.status == "closed"

    @location = "airborne"
    # airport.release(self)
    puts "Plane has taken off successfully and is now #{@location}"
  end
end
