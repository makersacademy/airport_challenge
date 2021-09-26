class Plane

  def initialize(airport)
    # TODO: move this exception to the land method of the Airport class 
    raise "Airport is full!" if airport.full?

    @location = airport
    @is_flying = false
    @destination = nil
    airport.land(self)
  end

  def next_destination(airport)
    raise "Plane is already in the #{airport.name} airport!" if @location == airport
    @destination = airport

    return "Fasten your seatbelts, please. We are ready to take off!"
  end

  def take_off
    raise "Plane already flying to the #{@destination.name}!" if @is_flying
    raise "Set destination first!" unless @destination

    # TODO: move this exception to the departure method of the Airport class 
    raise "Can't take off due to the weather condition. It's stormy outside!" if @location.stormy?

    @location.departure(self)
    @location = { name: "sky" }
    @is_flying = true

    return "Flying!"
  end

  def land_at(airport)
    raise "Plane already landed at #{@location.name}!" unless @is_flying

    # TODO: move these exceptions to the land method of the Airport class 
    raise "Can't land at #{airport.name} airport. It's already full!" if airport.full?
    raise "Can't land due to the weather condition. It's stormy outside!" if airport.stormy?

    @location = airport
    @is_flying = false

    if @destination == airport
      @destination = nil
    end

    airport.land(self)

    return "Successfully landed at #{airport.name} airport."
  end

end
