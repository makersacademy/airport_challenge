class Plane
  attr_reader :flight_id
  attr_accessor :location
  def initialize(flight_id)
    @flight_id = flight_id
    @location = ''
  end
  
end
