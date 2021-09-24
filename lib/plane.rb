class Plane
  attr_reader :location

  def initialize(airport)
    @location = airport
    @is_flying = false
    @destination = nil
  end

  def next_destination(airport)
    @destination = airport
    return "Fasten your seatbelts, please. We are ready to take off!"
  end

  def take_off
    raise "Plane already flying to the #{@destination.name}!" if @is_flying
    raise "Set destination first!" unless @destination

    @location = { name: "sky" }
    @is_flying = true
    return "Flying!"
  end

  def land_at(airport)
    raise "Plane already landed at #{@location.name}!" unless @is_flying
    raise "Can't land at #{airport.name} airport. It's already full!" if airport.full?
   
    @location = airport
    return "Successfully landed at #{airport.name} airport."
  end

end
