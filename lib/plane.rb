class Plane
  attr_reader :airline, :flight_number, :next_takeoff_destination

  def initialize(airline:, flight_number:, next_takeoff_destination:)
    @airline = airline
    @flight_number = flight_number
    @next_takeoff_destination = next_takeoff_destination
  end

  def flight_details
    {airline: @airline, flight_number: @flight_number, next_takeoff_destination: @next_takeoff_destination}
  end
end