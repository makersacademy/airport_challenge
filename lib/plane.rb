class Plane
  attr_reader :in_flight, :flight_id
  @@next_flight_id = 1

  def initialize(args = {})
    @in_flight = true
    @flight_id = args[:flight_id] || @@next_flight_id
    @@next_flight_id += 1 if args[:flight_id] == nil
    cleared_to_land(args[:airport]) if args[:airport] != nil
  end

  def cleared_to_land(airport)
    raise('Plane already landed!') if @in_flight == false

    airport.land_plane(self)
    @in_flight = false
  end

  def cleared_for_take_off(airport)
    raise('Plane already in flight!') if @in_flight == true

    airport.plane_departed(self)
    @in_flight = true
  end

end
