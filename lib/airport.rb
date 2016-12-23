require_relative './weather'
require_relative './plane'
class Airport
  attr_reader :planes, :weather, :number, :capacity

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(aircraft, weather)
    raise "Cannot land a plane that has already landed!" if aircraft.status == :in_airport
    unless stormy?(weather) || full?
      change_status_in_airport(aircraft)
      @planes << aircraft
    end
  end

  def take_off(aircraft, weather)
    raise "A plane that is already in the air cannot take off!" if aircraft.status == :in_air
    unless stormy?(weather)
      aircraft_location = @planes.index(aircraft)
      @planes.reject! {|plane|
        @planes.index(plane) == aircraft_location
      }
      change_status_in_air(aircraft)
    end
  end

  def stormy?(weather)
    weather
  end

  def full?
    @planes.count >= @capacity
  end

  def change_status_in_airport(aircraft)
    aircraft.status_to_in_airport
  end

  def change_status_in_air(aircraft)
    aircraft.status_to_in_air
  end

end
